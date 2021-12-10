"""
TOrC: Test Oracle based on CNN
----

Author: Valdivino Alexandre de Santiago Júnior

Licence: GNU GENERAL PUBLIC LICENSE, Version 3 (GPLv3)

"""

from prettytable import PrettyTable
import time
import torch
from utilsio import *
import numpy as np


def count_parameters(model):
    table = PrettyTable(["Modules", "Parameters"])
    total_params = 0
    for name, parameter in model.named_parameters():
        if not parameter.requires_grad: continue
        param = parameter.numel()
        table.add_row([name, param])
        total_params+=param
    print(table)
    print(f"Total Trainable Params: {total_params}")
    return total_params


def detect_classifications(model, p, bm, dl, dv, cl_names):
    since = time.time()
    model.load_state_dict(torch.load(bm))
    was_training = model.training
    print('Classification Analysis - was_training: ', was_training)
    model.eval()
    
    d_misc = {}
    d_corr = {}

    with torch.no_grad():
        for i, (inputs, labels, paths) in enumerate(dl[p]):
            inputs = inputs.to(dv)
            labels = labels.to(dv)

            outputs = model(inputs)
            _, preds = torch.max(outputs, 1)
                        
            for j in range(inputs.size()[0]):
              if (preds[j] != labels.data[j]):
                val_misc = ''
                val_misc = 'Pred: ' + cl_names[preds[j]] + ' - Truth: ' + cl_names[labels.data[j]]
                d_misc[paths[j]] = val_misc
              else:
                val_corr = ''
                val_corr = 'Pred: ' + cl_names[preds[j]] + ' - Truth: ' + cl_names[labels.data[j]]
                d_corr[paths[j]] = val_corr

        model.train(mode=was_training)
        time_elapsed = time.time() - since
        print('Classification Analysis complete in {:.0f}m {:.0f}s'.format(
        time_elapsed // 60, time_elapsed % 60))
        
    return d_misc, d_corr

def analyse_classifications(model, dl, dv, cl_names):
  # Get user options
  out_dir, bm, ind, early_prop, num_epochs = get_user_options()
  phase = ['train', 'val', 'test']
  for p in phase:
    misc = {}
    corr = {}
    misc, corr = detect_classifications(model, p, bm, dl, dv, cl_names)
    l_misc = []
    for i in misc:
      ind_mi = 'Misc Image: '+i+' / Verdict --> '+misc[i]
      l_misc.append(ind_mi)
    l_corr = [] 
    for j in corr:
      ind_co = 'Corr Image: '+j+' / Verdict --> '+corr[j]
      l_corr.append(ind_co)

    print('Number of misclassified images - {} : {} / {}'.format(p, len(misc), len(l_misc)))  
    l_misc.append('Number of misclassified images - '+p+ ' : ' + str(len(misc)))
    print('@'*20)
    print('Number of correctly classified images - {} : {} / {}'.format(p, len(corr), len(l_corr)))  
    l_corr.append('Number of correctly classified images - '+p+ ' : ' + str(len(corr)))
    save_files_class(out_dir, 'classifications_'+p, ind, l_misc, l_corr)
    print('@'*80)
    print()
    
    
    
def detect_classifications_ext(model, p, bm, dl, dv, cl_names, bat, nef, exdir):
    since = time.time()
    model.load_state_dict(torch.load(bm))
    was_training = model.training
    print('Classification Analysis - was_training: ', was_training)
    model = model.float()
    model.eval()
    
    d_misc = {}
    d_corr = {}

    with torch.no_grad():
        for i, (inputs, labels, paths) in enumerate(dl[p]):
            inputs = inputs.to(dv)
            labels = labels.to(dv)
            
            ext_data_mat = np.zeros((bat, nef))
            for k in range(inputs.size()[0]):
                ext_data = []
                extf_f = exdir+p+'/'+cl_names[labels.data[k]]+'/'+short_name(paths[k])+'.txt'
                ext_data = open_files(extf_f)
                ext_data_mat[k] = ext_data
                            
                
            ext_data_tensor = torch.from_numpy(ext_data_mat)
            ext_data_tensor = ext_data_tensor.to(dv)

            outputs = model(inputs.float(), ext_data_tensor.float())
            _, preds = torch.max(outputs, 1)
            
            
            for j in range(inputs.size()[0]):
              if (preds[j] != labels.data[j]):
                val_misc = ''
                val_misc = 'Pred: ' + cl_names[preds[j]] + ' - Truth: ' + cl_names[labels.data[j]]
                d_misc[paths[j]] = val_misc
              else:
                val_corr = ''
                val_corr = 'Pred: ' + cl_names[preds[j]] + ' - Truth: ' + cl_names[labels.data[j]]
                d_corr[paths[j]] = val_corr

        model.train(mode=was_training)
        time_elapsed = time.time() - since
        print('Classification Analysis complete in {:.0f}m {:.0f}s'.format(
        time_elapsed // 60, time_elapsed % 60))
        
    return d_misc, d_corr 

def analyse_classifications_ext(model, dl, dv, cl_names):
  # Get user options
  out_dir, bm, ind, exdir, nef, bat, early_prop, num_epochs = get_user_options_ext()  
  phase = ['train', 'val', 'test']
  for p in phase:
    misc = {}
    corr = {}
    misc, corr = detect_classifications_ext(model, p, bm, dl, dv, cl_names, bat, nef, exdir)
    l_misc = []
    for i in misc:
      ind_mi = 'Misc Image: '+i+' / Verdict --> '+misc[i]
      l_misc.append(ind_mi)
    l_corr = [] 
    for j in corr:
      ind_co = 'Corr Image: '+j+' / Verdict --> '+corr[j]
      l_corr.append(ind_co)

    print('Number of misclassified images - {} : {} / {}'.format(p, len(misc), len(l_misc)))  
    l_misc.append('Number of misclassified images - '+p+ ' : ' + str(len(misc)))
    print('@'*20)
    print('Number of correctly classified images - {} : {} / {}'.format(p, len(corr), len(l_corr)))  
    l_corr.append('Number of correctly classified images - '+p+ ' : ' + str(len(corr)))
    save_files_class(out_dir, 'classifications_'+p, ind, l_misc, l_corr)
    print('@'*80)
    print()  