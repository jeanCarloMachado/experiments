import re

def process_files(filenames):
    file_to_terms = {}
    for file in filenames:
        pattern = re.compile('[\W_]+')
        file_to_terms[file] = open(file, 'r').read().lower()
        file_to_terms[file] = pattern.sub(' ', file_to_terms[file])
        re.sub(r'[\W_]+', '', file_to_terms[file])
        file_to_terms[file] = file_to_terms[file].split()
    return file_to_terms


def index_one_file(termlist):
    fileIndex = {}
    for index, word in enumerate(termlist):
        if word in fileIndex.keys():
            fileIndex[word].append(index)
        else:
            fileIndex[word] = [index]
    return fileIndex


def make_indices(termlists):
    total = {}
    for filename in termlists.keys():
        total[filename] = index_one_file(termlists[filename])
    return total


def fullIndex(regdex):
    total_index = {}
    for filename in regdex.keys():
        for word in regdex[filename].keys():
            if word in total_index.keys():
                if filename in total_index[word].keys():
                    total_index[word][filename].extend(regdex[filename][word][:])
                else:
                    total_index[word][filename] = regdex[filename][word]
            else:
                total_index[word] = {filename: regdex[filename][word]}
    return total_index



def one_word_query(word, invertedIndex):
    pattern = re.compile('[\W_]+')
    word = pattern.sub(' ',word)
    if word in invertedIndex.keys():
        return [filename for filename in invertedIndex[word].keys()]
    else:
        return []

def free_text_query(string, invertedIndex):
    pattern = re.compile('[\W_]+')
    string = pattern.sub(' ',string)
    result = []
    for word in string.split():
        result += one_word_query(word, invertedIndex)
    return list(set(result))

def phrase_query(string, invertedIndex):
    pattern = re.compile('[\W_]+')
    string = pattern.sub(' ',string)
    listOfLists, result = [],[]
    for word in string.split():
        listOfLists.append(one_word_query(word))
    setted = set(listOfLists[0]).intersection(*listOfLists)
    for filename in setted:
        temp = []
        for word in string.split():
            temp.append(invertedIndex[word][filename][:])
        for i in range(len(temp)):
            for ind in range(len(temp[i])):
                temp[i][ind] -= i
        if set(temp[0]).intersection(*temp):
            result.append(filename)
    return rankResults(result,string)


data = process_files(['data/a.txt', 'data/b.txt', 'data/c.txt'])

indiced = make_indices(data)

invertedIndex = fullIndex(indiced)

one_word_query('b', invertedIndex)

free_text_query('gandalf', invertedIndex)

