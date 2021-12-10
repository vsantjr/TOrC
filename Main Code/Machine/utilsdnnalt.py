"""
TOrC: Test Oracle based on CNN
----

Author: Valdivino Alexandre de Santiago Júnior

Licence: GNU GENERAL PUBLIC LICENSE, Version 3 (GPLv3)

"""


from prettytable import PrettyTable
import time
import torch
from utilsioalt import *
import numpy as np
from torchvision import models
import torch.nn as nn
import torch.nn.functional as F


def get_data_CNNInd(op, pre):
  model_e = []
  num_ft = -1 # Number of input features
  if op =='1':
    model_e = models.resnet18(pretrained=pre)
    num_ft = model_e.fc.in_features
    print('Input features - ResNet-18:', num_ft) 
  elif op =='2':
    model_e = models.resnet34(pretrained=pre)
    num_ft = model_e.fc.in_features
    print('Input features - ResNet-34:', num_ft)
  elif op =='3':
    model_e = models.resnext50_32x4d(pretrained=pre)
    num_ft = model_e.fc.in_features
    print('Input features - ResNeXt-50-32x4d:', num_ft)
  elif op =='4':
    model_e = models.wide_resnet50_2(pretrained=pre)
    num_ft = model_e.fc.in_features
    print('Input features - Wide ResNet-50-2:', num_ft)
  elif op =='5':
    model_e = models.inception_v3(pretrained=pre, aux_logits=False)
    num_ft = model_e.fc.in_features
    print('Input features - Inception v3:', num_ft)
  elif op =='6':
    model_e = models.resnet152(pretrained=pre)
    num_ft = model_e.fc.in_features
    print('Input features - ResNet-152:', num_ft)
  elif op =='7':
    model_e = models.densenet161(pretrained=pre)
    num_ft = model_e.classifier.in_features
    print('Input features - DeseNet-161:', num_ft)
  else:
    print("Invalid Option!")

  return model_e, num_ft  

class ModelExtFeaturesInd1L(nn.Module):
    def __init__(self, option, pre_tr, n_ext, nc):
        super(ModelExtFeaturesInd1L, self).__init__()
        self.cnn, self.num_ftrs = get_data_CNNInd(option, pre_tr)
        if option != '7': 
          self.cnn.fc = nn.Linear(
              self.num_ftrs, self.num_ftrs)
        else: # DenseNet
          self.cnn.classifier = nn.Linear(
              self.num_ftrs, self.num_ftrs)  
        
        self.fc1 = nn.Sequential(
            nn.Linear(self.num_ftrs + n_ext, nc),
            nn.Softmax(dim=1)
        ) 
        
    def forward(self, image, data):
        x1 = self.cnn(image)
        x2 = data
        x = torch.cat((x1, x2), dim=1)
        x = self.fc1(x)
        return x

class ModelExtFeaturesInd2L(nn.Module):
    def __init__(self, option, pre_tr, n_ext, nc):
        super(ModelExtFeaturesInd2L, self).__init__()
        self.cnn, self.num_ftrs = get_data_CNNInd(option, pre_tr)
        if option != '7': 
          self.cnn.fc = nn.Linear(
              self.num_ftrs, self.num_ftrs)
        else: # DenseNet
          self.cnn.classifier = nn.Linear(
              self.num_ftrs, self.num_ftrs)  
        
        self.fc1 = nn.Linear(self.num_ftrs + n_ext, 256)
        self.fc2 = nn.Sequential(
            nn.Linear(256, nc),
            nn.Softmax(dim=1)
        ) 
        
        
    def forward(self, image, data):
        x1 = self.cnn(image)
        x2 = data
        x = torch.cat((x1, x2), dim=1)
        x = F.relu(self.fc1(x))
        x = self.fc2(x)
        return x


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


def detect_classifications(mod_opt, num_ftrs, num_classes, p, bm, dl, dv, cl_names):
    since = time.time()
    # Load the best model
    if mod_opt =='1':
        model = models.resnet18()
        model.fc = nn.Linear(num_ftrs, num_classes)
    elif mod_opt =='2':
        model = models.resnet34()
        model.fc = nn.Linear(num_ftrs, num_classes)
    elif mod_opt =='3':
        model = models.resnext50_32x4d()
        model.fc = nn.Linear(num_ftrs, num_classes)
    elif mod_opt =='4':
        model = models.wide_resnet50_2()
        model.fc = nn.Linear(num_ftrs, num_classes)
    elif mod_opt =='5':
        model = models.inception_v3(aux_logits=False)
        model.fc = nn.Linear(num_ftrs, num_classes)
    elif mod_opt =='6':
        model = models.resnet152()
        model.fc = nn.Linear(num_ftrs, num_classes)
    elif mod_opt =='7':
        model = models.densenet161()
        model.classifier = nn.Linear(num_ftrs, num_classes)
    else:
        print("Invalid Option!")
    
    model = model.to(dv)
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

def analyse_classifications(mod_opt, num_ftrs, num_classes, dl, dv, cl_names, fname):
  # Get user options
  out_dir, bm, ind, early_prop, num_epochs = get_user_options(fname)
  phase = ['train', 'val', 'test']
  for p in phase:
    misc = {}
    corr = {}
    misc, corr = detect_classifications(mod_opt, num_ftrs, num_classes, p, bm, dl, dv, cl_names)
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
    
    
    
def detect_classifications_ext(mod_opt, num_ftrs, num_classes, p, bm, dl, dv, cl_names, bat, nef, exdir, fname):
    since = time.time()
    
    # Load the best model
    if (fname == 'user_options1t') or (fname == 'user_options1s'): #TLE1L
        model = ModelExtFeaturesInd1L(mod_opt, False, nef, num_classes)  
    elif (fname == 'user_options2t') or (fname == 'user_options2s'): #TLE2L 
        model = ModelExtFeaturesInd2L(mod_opt, False, nef, num_classes)  
    else:
        print('Invalid option!')
    #model = ModelExtFeaturesInd(mod_opt, False, nef, num_classes)  
    model = model.to(dv)
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

def analyse_classifications_ext(mod_opt, num_ftrs, num_classes, dl, dv, cl_names, fname):
  # Get user options
  out_dir, bm, ind, exdir, nef, bat, early_prop, num_epochs = get_user_options_ext(fname)  
  phase = ['train', 'val', 'test']
  for p in phase:
    misc = {}
    corr = {}
    misc, corr = detect_classifications_ext(mod_opt, num_ftrs, num_classes, p, bm, dl, dv, cl_names, bat, nef, exdir, fname)
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