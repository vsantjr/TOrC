"""
Author: Valdivino Alexandre de Santiago Júnior

Licence: GNU GENERAL PUBLIC LICENSE, Version 3 (GPLv3)

This code makes part of the association rule algorithm (apriori) analysis. 
"""

import pandas as pd
from mlxtend.preprocessing import TransactionEncoder
from mlxtend.frequent_patterns import apriori
import csv
import numpy as np

"""
The checking_relative_support function is just to confirm the outcomes of the 
association rule algorithm (apriori), implemented in the mlxtend library
(http://rasbt.github.io/mlxtend/). This verification is for the 1-itemset
support only.
"""

def checking_relative_support(d, itset):
    rel_support = {}
    for i in range(len(itset)):
       mask = df[itset[i]].isin([True])
       arr_mask = mask.values
       tid = np.count_nonzero(arr_mask == True)
       rel_support[itset[i]] = tid/len(d)    
    
    return rel_support


"""
Run the main code. There are two csv files to consider, where each one must be
run separately:
    a.) input_apriori_misclassified.csv: it contains all misclassified images (errors) 
    by the three best CNNs according to the analysis of the article: DenseNet-161, 
    ResNet-18, Inception v3;
    b.) input_apriori_correct.csv: it contains all correctly classified images by the 
    three best CNNs according to the analysis of the article: DenseNet-161, ResNet-18,
    Inception v3.
    
Just change the name of the file to see the results.    
"""   

dataset = []

with open('input_apriori_correct.csv') as csv_file:
    csv_reader = csv.reader(csv_file, delimiter=',')
    line_count = 0
    for row in csv_reader:
        if line_count == 0:
            print(f'Column names are: {", ".join(row)}\n')
            line_count += 1
        else:
            temp = []
            for i in range(5):
                temp.append(row[i])
            dataset.append(temp)    
            line_count += 1
    print(f'Processed {line_count} lines.')
print('#'*20)

te = TransactionEncoder()
te_ary = te.fit(dataset).transform(dataset)
df = pd.DataFrame(te_ary, columns=te.columns_)

print('\nChecking 1-itemset support: ')
itemsets = ['Densenet-161', 'Inceptionv3', 'ResNet-18', 'SS', 'TD', 'TL', 'TLE1L',
          'TLE2L', 'correct', 'mutant']
relative_support = checking_relative_support(df, itemsets)
print('support\t\t\t itemsets')
for k, v in relative_support.items():
        print('{}\t{}'.format(v,k))
print('#'*20)

freq_itemsets = apriori(df, min_support=0.2, use_colnames=True)
print('\nRelative support - Frequent itemsets:')
print(freq_itemsets)