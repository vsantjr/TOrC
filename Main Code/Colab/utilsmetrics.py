"""
TOrC: Test Oracle based on CNN
----

Author: Valdivino Alexandre de Santiago Júnior

Licence: GNU GENERAL PUBLIC LICENSE, Version 3 (GPLv3)

"""

from sklearn.metrics import confusion_matrix
from sklearn import metrics

def all_metrics(y_true, y_pred, av = 'weighted'):
  print('Metrics - Average: ', av)
  
  cmat = confusion_matrix(y_true, y_pred)
  precision = metrics.precision_score(y_true, y_pred, average=av)
  recall = metrics.recall_score(y_true, y_pred, average=av)
  f1_sc = metrics.f1_score(y_true, y_pred, average=av)
  
  return precision, recall, f1_sc, cmat

