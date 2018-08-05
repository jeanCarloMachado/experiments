import pandas as pd
import time
import redis
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import linear_kernel

def info(msg):
    print(msg)

class ContentEngine(object):

    SIMKEY = 'p:smlr:%s'

    def __init__(self):
        self._r = redis.StrictRedis.from_url('http://127.0.0.1:6379')

    def train(self, data_source):
        start = time.time()
        ds = pd.read_csv(data_source)
        info("Training data ingested in %s seconds." % (time.time() - start))
        self._r.flushdb()

        start = time.time()
        self._train(ds)


    def _train(self, ds):

        tf = TfidfVectorizer(analyzer='word',
                ngram_range=(1,3),
                min_df=0,
                stop_words='english')
        tfidf_matrix = tf.fit_transform(ds['description'])

        cosine_similarities = linear_kernel(tfidf_matrix, tfidf_matrix)

        for idx, row in ds.iterrows():
            similar_indices = cosine_similarities[idx].argsort()[:-100:-1]
            similar_items = [(cosine_similarities[idx][i], ds['id'][i])
                    for i in similar_indices]

            flattened = sum(similar_items[1:], ())
            self._r.zadd(self.SIMKEY % row['id'], *flattened)

    def predict(self, item_id, num):
        return self._r.zrange(self.SIMKEY % item_id, 0, num-1,withscores=True, desc=True)

content_engine = ContentEngine()
content_engine.train('sample-data.csv')
print(content_engine.predict(500, 3))
