#!/usr/bin/env python
# coding: utf-8


"""
## **TOrC: Test Oracle based on CNN**
----

**Article:** A Method and Experiment to evaluate Deep Neural Networks as
Test Oracles for Scientific Software 

<br>

**Author**: Valdivino Alexandre de Santiago Júnior

<br>

**Licence**: GNU GENERAL PUBLIC LICENSE, Version 3 (GPLv3)

<br>

This program is part of the implementation of the **Test Oracle based on CNN** (TOrC) method presented in the abovementioned article. It refers to the architecture configuration **TLE1L** and it is based on a PyTorch tutorial for <a href="https://pytorch.org/tutorials/beginner/transfer_learning_tutorial.html">transfer learning</a>.

<br>
"""


from __future__ import print_function, division
import matplotlib.pyplot as plt
import numpy as np
import PIL
import torch
import torch.nn as nn
import torch.optim as optim
from torch.optim import lr_scheduler
import torchvision
from torchvision import datasets, models, transforms
from utilsioalt import *
from utilsdnnalt import *
from phasesdnnalt import *
import os
import sys



# Input arguments:

opt = sys.argv[1]

optdp = sys.argv[2] 

nameid = sys.argv[3]




# In[ ]:


# Custom dataset that includes image file paths. Extends 
# torchvision.datasets.ImageFolder

class FileNames(datasets.ImageFolder):
    
    # Override the __getitem__ method. this is the method that dataloader calls
    def __getitem__(self, index):
        # This is what ImageFolder normally returns 
        original_tuple = super(FileNames, self).__getitem__(index)
        # The image file path
        path = self.imgs[index][0]
        # Make a new tuple that includes original and the path
        tuple_with_path = (original_tuple + (path,))
        return tuple_with_path
        


# ## **Select the CNN and Dataset Profile**
# ----
# 
# Select the CNN and dataset profile. Moreover, as mentioned in <a href="https://pytorch.org/vision/stable/models.html">torchvision.models</a>:
# 
# <br>
# 
# "All pre-trained models expect input images normalized in the same way, i.e. mini-batches of 3-channel RGB images of shape (3 x H x W), where H and W are expected to be at least 224. The images have to be loaded in to a range of [0, 1] and then normalized using mean = [0.485, 0.456, 0.406] and std = [0.229, 0.224, 0.225]."
# 
# <br>
# 
# Thus, all images are cropped to 224 x 224 (variable ```hei_wid```), with the exception of Inception v3 whose cropping should be 299 x 299.
# 
# <br>

# In[ ]:


# Auxiliary variables: all training and validation losses and accuracies; 
# precision, recall, and F1-score during the training phase
all_losses_acc = []
d_precision = {}
d_recall = {}
d_f1 = {}

# Epochs and early stopping
number_epochs = 100
early_proportion = 0.2

# Variables related to the CNN selection
indic = ''
hei_wid = 224
bs = 4 # Mini-batch size
n_ext = 1024 # Number of external ORB features
is_pretrained = True

#print("Select the CNN: ")
#print("Press '1' for ResNet-18.")
#print("Press '2' for ResNet-34.")
#print("Press '3' for ResNeXt-50-32x4d.")
#print("Press '4' for Wide ResNet-50-2.")
#print("Press '5' for Inception v3.")
#print("Press '6' for ResNet-152.")
#print("Press '7' for DenseNet-161.\n\n")
print('Model is number: ', opt)
if opt =='1':
   	print("You selected ResNet-18!")
   	indic = 'TOrC_TLE1L_ResNet-18'
elif opt =='2':
   	print("You selected ResNet-34!")
   	indic = 'TOrC_TLE1L_ResNet-34' 		
elif opt =='3':
   	print("You selected ResNeXt-50-32x4d!")
   	indic = 'TOrC_TLE1L_ResNeXt-50-32x4d'
elif opt =='4':
   	print("You selected Wide ResNet-50-2!")
   	indic = 'TOrC_TLE1L_WideResNet-50-2'
elif opt =='5':
    hei_wid = 299
    print("You selected Inception v3!")
    indic = 'TOrC_TLE1L_Inceptionv3'
elif opt =='6':
   	print("You selected ResNet-152!")
   	indic = 'TOrC_TLE1L_ResNet-152'
elif opt =='7':
   	print("You selected DenseNet-161!")
   	indic = 'TOrC_TLE1L_DenseNet-161' 		
else:
   	print("Invalid Option!")    


# In[ ]:


# Variable related to the dataset profile selection
data_dir = ''
extf_dir = ''
#print("Select the Dataset Profile: ")
#print("Press '1' for TD.")
#print("Press '2' for SS.\n\n")
#optdp = input("Enter your choice:")
print('Dataset profile is number: ', optdp)
if optdp =='1':
  print("You selected TD!")
  data_dir = 'TDdataset'
  extf_dir = 'TDorbfeatures/'
  indic += '_TD'
elif optdp =='2':
  print("You selected SS!")
  data_dir = 'SSdataset'
  extf_dir = 'SSorbfeatures/'
  indic += '_SS'
else:
    print("Invalid Option!")

# All relevant outputs are here. Create directory if it does not exist.
if not os.path.exists('tout'+nameid+'/'+indic):
    os.makedirs('tout'+nameid+'/'+indic)
    
output_dir = './tout'+nameid+'/'+indic   

if not os.path.exists('best'+nameid+'/d'+opt+optdp):
    os.makedirs('best'+nameid+'/d'+opt+optdp)  
    
# The best model obtained during the training phase.
best_model_full = './best'+nameid+'/d'+opt+optdp+'/best_model_'+indic+'.pt'  

# Save user options
fname = 'user_options'+nameid
save_user_options_ext(output_dir, best_model_full, indic, extf_dir, n_ext, bs,
                      early_proportion, number_epochs, fname)

# Tranformations for each dataset
data_transforms = {
    'train': transforms.Compose([
        transforms.CenterCrop(hei_wid), 
        transforms.ToTensor(),
        transforms.Normalize([0.485, 0.456, 0.406], [0.229, 0.224, 0.225])
    ]),
    'val': transforms.Compose([
        transforms.CenterCrop(hei_wid), 
        transforms.ToTensor(),
        transforms.Normalize([0.485, 0.456, 0.406], [0.229, 0.224, 0.225])
    ]),
    'test': transforms.Compose([
        transforms.CenterCrop(hei_wid), 
        transforms.ToTensor(),
        transforms.Normalize([0.485, 0.456, 0.406], [0.229, 0.224, 0.225])
    ])
}

image_datasets = {x: FileNames(os.path.join(data_dir, x),
                                          data_transforms[x])
                  for x in ['train', 'val', 'test']}

dataloaders = {x: torch.utils.data.DataLoader(image_datasets[x], batch_size=bs,
                                             shuffle=True, num_workers=2)
              for x in ['train', 'val', 'test']}

dataset_sizes = {x: len(image_datasets[x]) for x in ['train', 'val', 'test']}

# Just checking the sizes
print('\nDataset sizes: ', dataset_sizes)
print('Dataloaders sizes: ', len(dataloaders))
class_names = image_datasets['train'].classes
class_namesv = image_datasets['val'].classes
class_namest = image_datasets['test'].classes
print('Training classes: ', class_names)
print('Training lengths: ', len(class_names))
print('Validation classes: ', class_namesv)
print('Validation lengths: ', len(class_namesv))
print('Test classes: ', class_namest)
print('Test lengths: ', len(class_namest))
print('Height x Width: {} x {}'.format(hei_wid,hei_wid))
device = torch.device("cuda:0" if torch.cuda.is_available() else "cpu")


# ## **Define the Network Configuration**
# ----
# 
# Since the network configuration is **TLE1L**, we add one extra layer
# with the same number of input features due to the CNN plus
# 1,024 elements obtained by the feature detector and description algorithm ORB. The last fully-connected layer contains two neurons (binary classification).
# 
# <br>

# In[ ]:


def get_num_ftrs_CNN(op):
  num_ft = -1 # Number of input features
  if (op =='1') or (op =='2'):
    num_ft = 512
  elif (op =='3') or (op =='4') or (op =='5') or (op =='6'):
    num_ft = 2048
  elif op =='7':
    num_ft = 2208
  else:
    print("Invalid Option!")

  return num_ft  


# In[ ]:


def get_data_CNN(op, pre):
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


# In[ ]:


num_classes = 2 # Binary classification
class ModelExtFeatures(nn.Module):
    def __init__(self, option, pre_tr):
        super(ModelExtFeatures, self).__init__()
        self.cnn, self.num_ftrs = get_data_CNN(option, pre_tr)
        if option != '7': 
          self.cnn.fc = nn.Linear(
              self.num_ftrs, self.num_ftrs)
        else: # DenseNet
          self.cnn.classifier = nn.Linear(
              self.num_ftrs, self.num_ftrs)  
        
        self.fc1 = nn.Sequential(
            nn.Linear(self.num_ftrs + n_ext, num_classes),
            nn.Softmax(dim=1)
        ) 
        
    def forward(self, image, data):
        x1 = self.cnn(image)
        x2 = data
        x = torch.cat((x1, x2), dim=1)
        x = self.fc1(x)
        return x


model_ft = ModelExtFeatures(opt, is_pretrained)
model_ft = model_ft.to(device)

# Get the number of input features only
ret_num_ftrs = get_num_ftrs_CNN(opt)
print('Checking the number of input features: ', ret_num_ftrs)

# Cross-entropy Loss
criterion_ft = nn.CrossEntropyLoss()

# All parameters are being optimized
optimizer_ft = optim.SGD(model_ft.parameters(), lr=0.001, momentum=0.9)

# Decrease learning rate by a factor of 0.1 every 7 epochs
exp_lr_scheduler = lr_scheduler.StepLR(optimizer_ft, step_size=7, gamma=0.1)

print('\nNumber of Trainable Parameters!')

print('Checking trainable parameters {}: {}'.format(indic, count_parameters(model_ft)))


# ## **Run the Training Phase**
# ----
# 
# Now, we can run the training phase. Function ```train_model_ext``` also returns values of loss, accuracy, precision, recall, and F1-score obtained during this phase.
# 
# <br>

# In[ ]:


model_ft, all_losses_acc, d_precision, d_recall, d_f1 = train_model_ext(model_ft, 
                  criterion_ft, optimizer_ft, exp_lr_scheduler, dataloaders,
                  dataset_sizes, device, class_names, fname)  


# ## **Plots of Metrics of the Training Phase**
# ----
# 
# Plots showing loss and accuracy values as well as values of precision, recall, and F1-score generated during the training phase.
# 
# <br>

# In[ ]:


plot_training_metrics_ext(all_losses_acc, d_precision, d_recall, d_f1, fname)


# ## **Run the Inference Phase**
# ----
# 
# Now, we can run the inference phase.
# 
# <br>

# In[ ]:


test_model_ext(opt, ret_num_ftrs, num_classes, criterion_ft, dataloaders, dataset_sizes, device, class_names, fname)


# ## **Analyse the Classification**
# ----
# 
# The function below obtains the misclassified (errors) and correctly classified images for all datasets. It also considers the extra ORB features when doing so. The most relevant is due to the test dataset.
# 
# <br>

# In[ ]:


analyse_classifications_ext(opt, ret_num_ftrs, num_classes, dataloaders, device, class_names, fname)
  


# In[ ]:




