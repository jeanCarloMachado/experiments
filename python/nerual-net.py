import numpy as np
from sklearn import datasets
from sklearn import linear_model
import matplotlib.pyplot as plt

np.random.seed(0)
X, y = datasets.make_moons(200, noise=0.20)
plt.scatter(X[:,0], X[:,1], s=40, c=y, cmap=plt.cm.Spectral)

clf = linear_model.LogisticRegressionCV()
clf.fit(X, y)

plot_decision_boundary(lambda x: clf.predict(x))

plt.title("Logistic regression")
plt.show()
