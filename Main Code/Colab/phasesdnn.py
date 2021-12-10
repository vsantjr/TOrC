"""
TOrC: Test Oracle based on CNN
----

Author: Valdivino Alexandre de Santiago Júnior

Licence: GNU GENERAL PUBLIC LICENSE, Version 3 (GPLv3)

"""

import time
import numpy as np
import sys
import torch
import os
from utilsmetrics import *
from utilsio import *

# Training phase (training and validation)
def train_model(model, criterion, optimizer, scheduler, dataloaders, dataset_sizes, device):
    since = time.time()
    # Get user options
    output_dir, best_model_full, indic, early_prop, num_epochs = get_user_options()
    # Dictionaries: truth and preds values
    d_truth = {}
    d_preds = {}
    # Auxiliary variables: training and validation losses and accuracy; 
    # precision, recall, and F1-score
    train_losses = []
    val_losses = []
    train_acc = []
    val_acc = []
    all_losses_acc = []
    d_precision = {}
    d_recall = {}
    d_f1 = {}
    # m_best: 3D matrix with the best values of metrics and epochs in which they occurred
      # Dimension 1: 'train', 'val' (phases)
      # Dimension 2: acc, prec, rec, f1 (metrics), loss
      # Dimension 3: best value, best epoch
    m_best = np.zeros((2, 5, 2))
    m_best[0][4][0], m_best[1][4][0] = sys.float_info.max, sys.float_info.max
    epoch, no_improvements = 0, 0
    # Regularisation: early stopping
    early_stopping = round(early_prop*num_epochs)
    print('Early stopping - Epochs: ', early_stopping)
    #### Main loop: Begin
    while (epoch < num_epochs) and (no_improvements < early_stopping):
        print('Epoch {}/{}'.format(epoch+1, num_epochs))
        print('-' * 10)
        #### Each epoch has a training and validation phase: Begin
        for phase in ['train', 'val']:
            if phase == 'train':
                model.train()  # Set model to training mode
            else:
                model.eval()   # Set model to evaluate mode

            running_loss = 0.0
            running_corrects = 0
            count = 0
            all_y_truth = torch.zeros(4)
            all_y_preds = torch.zeros(4)
            
            #### Iterate over data: Begin
            for inputs, labels, paths in dataloaders[phase]:
                inputs = inputs.to(device) # Send to GPU
                labels = labels.to(device) # Send to GPU

                # Zero the parameter gradients
                optimizer.zero_grad() 
                with torch.set_grad_enabled(phase == 'train'):
                    outputs = model(inputs)
                    _, preds = torch.max(outputs, 1)  
                    loss = criterion(outputs, labels)

                    # Backward + optimise only if in training phase. 
                    if phase == 'train':
                        loss.backward()
                        optimizer.step()

                
                count+=1
                running_loss += loss.item() * inputs.size(0)
                running_corrects += torch.sum(preds == labels.data)
                
                if (count == 1):
                    all_y_truth = labels.data.detach().clone()
                    all_y_preds = preds.detach().clone()
                else:
                    all_y_truth=torch.cat((all_y_truth, labels.data), 0) 
                    all_y_preds=torch.cat((all_y_preds, preds), 0) 
                
                d_truth[phase]=all_y_truth
                d_preds[phase]=all_y_preds

            #### Iterate over data: End    
            
            if phase == 'train':
                scheduler.step()

            epoch_loss = running_loss / dataset_sizes[phase]
            epoch_acc = running_corrects.double() / dataset_sizes[phase]

            # Calculate all metrics
            prec, rec, f1, cm = all_metrics(d_truth[phase].cpu(),d_preds[phase].cpu())
            print('Precision: ', prec, ' - Recall: ', rec, ' - F1: ', f1, ' - Conf Matrix: ', cm)
            save_files(phase, '-', 'cm', output_dir, indic,epoch+1, cm)
            save_files(phase, '-','me', output_dir, indic, epoch+1, [prec,rec,f1]) 
            
            if ((epoch + 1) == 1):
                d_precision[phase] = [prec]
                d_recall[phase] = [rec]
                d_f1[phase] = [f1]
            else:
                all_m = [[] for i in range(3)]
                all_m[0] = d_precision[phase]
                all_m[0].append(prec)
                d_precision[phase] =  all_m[0]
                all_m[1] = d_recall[phase]
                all_m[1].append(rec)
                d_recall[phase] =  all_m[1]
                all_m[2] = d_f1[phase]
                all_m[2].append(f1)
                d_f1[phase] =  all_m[2]
             
            # Update matrix m_best: precision, recall, F1-score  
            if phase == 'train':
              train_losses.append(epoch_loss)
              train_acc.append(epoch_acc)
              
                            
              if (prec > m_best[0][1][0]):
                 m_best[0][1][0] = prec
                 m_best[0][1][1] = epoch + 1
              if (rec > m_best[0][2][0]):
                 m_best[0][2][0] = rec
                 m_best[0][2][1] = epoch + 1   
              if (f1 > m_best[0][3][0]):
                 m_best[0][3][0] = f1
                 m_best[0][3][1] = epoch + 1  
                           
            else:
              val_losses.append(epoch_loss)
              val_acc.append(epoch_acc)
              

              if (prec > m_best[1][1][0]):
                 m_best[1][1][0] = prec
                 m_best[1][1][1] = epoch + 1
              if (rec > m_best[1][2][0]):
                 m_best[1][2][0] = rec
                 m_best[1][2][1] = epoch + 1   
              if (f1 > m_best[1][3][0]):
                 m_best[1][3][0] = f1
                 m_best[1][3][1] = epoch + 1  
              
            print('{} Loss: {:.4f} -- Acc: {:.4f}'.format(
                phase, epoch_loss, epoch_acc))
            
            # Update matrix m_best: accuracy
            if (phase == 'val' and epoch_acc > m_best[1][0][0]):
                m_best[1][0][0] = epoch_acc
                m_best[1][0][1] = epoch + 1
                print('@@@@ Val Acc: Improvement Ok!!!!')
            elif (phase == 'val' and epoch_acc <= m_best[1][0][0]):
                print('@@@@ Val Acc: NO Improvement!!!!')
            elif (phase == 'train' and epoch_acc > m_best[0][0][0]):
                m_best[0][0][0] = epoch_acc  
                m_best[0][0][1] = epoch + 1 
                print('%%%% Train Acc: Improvement Ok!!!!')
            elif (phase == 'train' and epoch_acc <= m_best[0][0][0]):
                print('%%%% Train Acc: NO Improvement!!!!')
            else:
              print('Invalid option!')  
            
            print('/'*40)
            # Copy the model with best performance (validation) and update m_best: loss
            if (phase == 'val' and epoch_loss < m_best[1][4][0]):
                m_best[1][4][0] = epoch_loss
                m_best[1][4][1] = epoch + 1
                no_improvements = 0
                if os.path.exists(best_model_full):
                   os.remove(best_model_full)
                   print('@@@@ Val Loss: Previous best Model removed!!!!')
                else:
                   print("@@@@ Val Loss: There is no saved Model yet!!!!")
                torch.save(model.state_dict(), best_model_full)
                print('@@@@ Val Loss: New best Model saved in Epoch: {} !!!!'.format(str(epoch + 1)))
            elif (phase == 'val' and epoch_loss >= m_best[1][4][0]):
                no_improvements+=1
                print('@@@@ Val Loss: NO Improvement!!!!')
            elif (phase == 'train' and epoch_loss < m_best[0][4][0]):
                m_best[0][4][0] = epoch_loss  
                m_best[0][4][1] = epoch + 1 
                print('%%%% Train Loss: Improvement Ok!!!!')
            elif (phase == 'train' and epoch_loss >= m_best[0][4][0]):
                print('%%%% Train Loss: NO Improvement!!!!')
            else:
              print('Invalid option!')     

        #### End Each epoch has a training and validation phase: End
        epoch+=1
        print()

    #### Main loop: End
    time_elapsed = time.time() - since
    print('Training complete in {:.0f}m {:.0f}s'.format(
        time_elapsed // 60, time_elapsed % 60))
    # Print best values of metrics   
    print('\nBest Training Precision: {:4f} in Epoch: {:4f}'.format(m_best[0][1][0], m_best[0][1][1]))
    print('\nBest Training Recall: {:4f} in Epoch: {:4f}'.format(m_best[0][2][0], m_best[0][2][1]))
    print('\nBest Trainning F1-Score: {:4f} in Epoch: {:4f}'.format(m_best[0][3][0], m_best[0][3][1]))
    print('\nBest Training Accuracy: {:4f} in Epoch: {:4f}'.format(m_best[0][0][0], m_best[0][0][1]))
    print('\nBest Training Loss: {:4f} in Epoch: {:4f}'.format(m_best[0][4][0], m_best[0][4][1]))
    print('#'*10)
    print('\nBest Validation Precision: {:4f} in Epoch: {:4f}'.format(m_best[1][1][0], m_best[1][1][1]))
    print('\nBest Validation Recall: {:4f} in Epoch: {:4f}'.format(m_best[1][2][0], m_best[1][2][1]))
    print('\nBest Validation F1-Score: {:4f} in Epoch: {:4f}'.format(m_best[1][3][0], m_best[1][3][1]))
    print('\nBest Validation Accuracy: {:4f} in Epoch: {:4f}'.format(m_best[1][0][0], m_best[1][0][1]))
    print('\nBest Validation Loss: {:4f} in Epoch: {:4f}'.format(m_best[1][4][0], m_best[1][4][1]))
    
    # Save best values of metrics
    save_files('train', 'w+', 'bm', output_dir, indic, epoch+1,
               [ [m_best[0][1][0], m_best[0][1][1]], [m_best[0][2][0], m_best[0][2][1]], [m_best[0][3][0], m_best[0][3][1]],
                [m_best[0][0][0], m_best[0][0][1]], [m_best[0][4][0], m_best[0][4][1]] ])
    save_files('val', 'a+', 'bm', output_dir, indic, epoch+1,
               [ [m_best[1][1][0], m_best[1][1][1]], [m_best[1][2][0], m_best[1][2][1]], [m_best[1][3][0], m_best[1][3][1]],
                [m_best[1][0][0], m_best[1][0][1]], [m_best[1][4][0], m_best[1][4][1]] ])
    
    
    
    all_losses_acc.append(train_losses)
    all_losses_acc.append(val_losses)
    all_losses_acc.append(train_acc)
    all_losses_acc.append(val_acc)
    
    return model, all_losses_acc, d_precision, d_recall, d_f1


# Inference phase
def test_model(model, crit, dataloaders, dataset_sizes, device): 
    since = time.time()
    # Get user options
    output_dir, bm, indic, early_prop, num_epochs = get_user_options()
    # Load the best model
    model.load_state_dict(torch.load(bm))
    was_training = model.training
    print('Testing - was_training: ', was_training)
    model.eval()
    
    epoch = 0
    # Dictionaries: truth and preds values
    d_truth = {}
    d_preds = {}
    
    running_loss = 0.0
    running_corrects = 0
    count = 0
    all_y_truth = torch.zeros(4)
    all_y_preds = torch.zeros(4)
    phase = 'test'
    with torch.no_grad():
        #### Iterate over data: Begin
        for i, (inputs, labels, paths) in enumerate(dataloaders[phase]):
            inputs = inputs.to(device)
            labels = labels.to(device)

            outputs = model(inputs)
            _, preds = torch.max(outputs, 1)

            loss = crit(outputs, labels)
                        
            count+=1
            running_loss += loss.item() * inputs.size(0)
            running_corrects += torch.sum(preds == labels.data)
                
            if (count == 1):
                  all_y_truth = labels.data.detach().clone()
                  all_y_preds = preds.detach().clone()
            else:
                  all_y_truth=torch.cat((all_y_truth, labels.data), 0) 
                  all_y_preds=torch.cat((all_y_preds, preds), 0) 
                
            d_truth[phase]=all_y_truth
            d_preds[phase]=all_y_preds
                       
        #### Iterate over data: End 

        test_loss = running_loss / dataset_sizes[phase]
        test_acc = running_corrects.double() / dataset_sizes[phase]
        
        prec, rec, f1, cm = all_metrics(d_truth[phase].cpu(),d_preds[phase].cpu())
        print('Precision: ', prec, ' - Recall: ', rec, ' - F1: ', f1, ' - Conf Matrix: ', cm)
        save_files('test', '-', 'cm', output_dir, indic,epoch+1, cm)
        print("test") 
        time_elapsed = time.time() - since
        print('Testing complete in {:.0f}m {:.0f}s'.format(
        time_elapsed // 60, time_elapsed % 60))
        # Print best values of metrics   
        print('\nTesting Precision: {:4f}'.format(prec))
        print('\nTesting Recall: {:4f}'.format(rec))
        print('\nTesting F1-Score: {:4f}'.format(f1))
        print('\nTesting Accuracy: {:4f}'.format(test_acc))
        print('\nTesting Loss: {:4f}'.format(test_loss))
        print('#'*10)
        
        # Save metrics
        save_files('test', 'w+', 'tm', output_dir, indic, epoch+1,
               [prec, rec, f1, test_acc, test_loss])
        model.train(mode=was_training)

# Training phase (training and validation)
def train_model_ext(model, criterion, optimizer, scheduler, dataloaders, dataset_sizes, device, class_names):
    since = time.time()
    # Get user options
    output_dir, best_model_full, indic, extf_dir, n_ext, bs, early_prop, num_epochs = get_user_options_ext()
    # Dictionaries: truth and preds values
    d_truth = {}
    d_preds = {}
    # Auxiliary variables: training and validation losses and accuracy; 
    # precision, recall, and F1-score
    train_losses = []
    val_losses = []
    train_acc = []
    val_acc = []
    all_losses_acc = []
    d_precision = {}
    d_recall = {}
    d_f1 = {}
    # m_best: 3D matrix with the best values of metrics and epochs in which they occurred
      # Dimension 1: 'train', 'val' (phases)
      # Dimension 2: acc, prec, rec, f1 (metrics), loss
      # Dimension 3: best value, best epoch
    m_best = np.zeros((2, 5, 2))
    m_best[0][4][0], m_best[1][4][0] = sys.float_info.max, sys.float_info.max
    model = model.float()
    epoch, no_improvements = 0, 0
    # Regularisation: early stopping
    early_stopping = round(early_prop*num_epochs)
    print('Early Stopping - Epochs: ', early_stopping)
    #### Main loop: Begin
    while (epoch < num_epochs) and (no_improvements < early_stopping):
        print('Epoch {}/{}'.format(epoch+1, num_epochs))
        print('-' * 10)
        #### Each epoch has a training and validation phase: Begin
        for phase in ['train', 'val']:
            if phase == 'train':
                model.train()  # Set model to training mode
            else:
                model.eval()   # Set model to evaluate mode

            running_loss = 0.0
            running_corrects = 0
            count = 0
            all_y_truth = torch.zeros(4)
            all_y_preds = torch.zeros(4)
            
            
            #### Iterate over data: Begin
            for inputs, labels, paths in dataloaders[phase]:
                inputs = inputs.to(device) # Send to GPU.
                labels = labels.to(device) # Send to GPU

                # Adding extra ORB features
                ext_data_mat = np.zeros((bs, n_ext))
                for j in range(inputs.size()[0]):
                   ext_data = []
                   extf_f = extf_dir+phase+'/'+class_names[labels.data[j]]+'/'+short_name(paths[j])+'.txt'
                   ext_data = open_files(extf_f)
                   ext_data_mat[j] = ext_data
                   
                ext_data_tensor = torch.from_numpy(ext_data_mat)
                ext_data_tensor = ext_data_tensor.to(device)
                  
                # Zero the parameter gradients
                optimizer.zero_grad() 
                with torch.set_grad_enabled(phase == 'train'):
                    outputs = model(inputs.float(), ext_data_tensor.float())
                    _, preds = torch.max(outputs, 1)  
                    loss = criterion(outputs, labels)

                    # Backward + optimise only if in training phase
                    if phase == 'train':
                        loss.backward()
                        optimizer.step()
                
                count+=1
                running_loss += loss.item() * inputs.size(0)
                running_corrects += torch.sum(preds == labels.data)
                
                if (count == 1):
                    all_y_truth = labels.data.detach().clone()
                    all_y_preds = preds.detach().clone()
                else:
                    all_y_truth=torch.cat((all_y_truth, labels.data), 0) 
                    all_y_preds=torch.cat((all_y_preds, preds), 0) 
                
                d_truth[phase]=all_y_truth
                d_preds[phase]=all_y_preds

            #### Iterate over data: End    
            
            if phase == 'train':
                scheduler.step()

            epoch_loss = running_loss / dataset_sizes[phase]
            epoch_acc = running_corrects.double() / dataset_sizes[phase]

            # Calculate all metrics
            prec, rec, f1, cm = all_metrics(d_truth[phase].cpu(),d_preds[phase].cpu())
            print('Precision: ', prec, ' - Recall: ', rec, ' - F1: ', f1, ' - Conf Matrix: ', cm)
            save_files(phase, '-', 'cm', output_dir, indic,epoch+1, cm)
            save_files(phase, '-','me', output_dir, indic, epoch+1, [prec,rec,f1]) 
            
            if ((epoch + 1) == 1):
                d_precision[phase] = [prec]
                d_recall[phase] = [rec]
                d_f1[phase] = [f1]
            else:
                all_m = [[] for i in range(3)]
                all_m[0] = d_precision[phase]
                all_m[0].append(prec)
                d_precision[phase] =  all_m[0]
                all_m[1] = d_recall[phase]
                all_m[1].append(rec)
                d_recall[phase] =  all_m[1]
                all_m[2] = d_f1[phase]
                all_m[2].append(f1)
                d_f1[phase] =  all_m[2]
             
            # Update matrix m_best: precision, recall, F1-score  
            if phase == 'train':
              train_losses.append(epoch_loss)
              train_acc.append(epoch_acc)
              
                            
              if (prec > m_best[0][1][0]):
                 m_best[0][1][0] = prec
                 m_best[0][1][1] = epoch + 1
              if (rec > m_best[0][2][0]):
                 m_best[0][2][0] = rec
                 m_best[0][2][1] = epoch + 1   
              if (f1 > m_best[0][3][0]):
                 m_best[0][3][0] = f1
                 m_best[0][3][1] = epoch + 1  
                           
            else:
              val_losses.append(epoch_loss)
              val_acc.append(epoch_acc)
              

              if (prec > m_best[1][1][0]):
                 m_best[1][1][0] = prec
                 m_best[1][1][1] = epoch + 1
              if (rec > m_best[1][2][0]):
                 m_best[1][2][0] = rec
                 m_best[1][2][1] = epoch + 1   
              if (f1 > m_best[1][3][0]):
                 m_best[1][3][0] = f1
                 m_best[1][3][1] = epoch + 1  
              
            print('{} Loss: {:.4f} -- Acc: {:.4f}'.format(
                phase, epoch_loss, epoch_acc))

            # Update matrix m_best: Accuracy
            if (phase == 'val' and epoch_acc > m_best[1][0][0]):
                m_best[1][0][0] = epoch_acc
                m_best[1][0][1] = epoch + 1
                print('@@@@ Val Acc: Improvement Ok!!!!')
            elif (phase == 'val' and epoch_acc <= m_best[1][0][0]):
                print('@@@@ Val Acc: NO Improvement!!!!')
            elif (phase == 'train' and epoch_acc > m_best[0][0][0]):
                m_best[0][0][0] = epoch_acc  
                m_best[0][0][1] = epoch + 1 
                print('%%%% Train Acc: Improvement Ok!!!!')
            elif (phase == 'train' and epoch_acc <= m_best[0][0][0]):
                print('%%%% Train Acc: NO Improvement!!!!')
            else:
              print('Invalid option!')  
            
            print('/'*40)
            # Copy the model with best performance (validation) and update m_best: loss
            if (phase == 'val' and epoch_loss < m_best[1][4][0]):
                m_best[1][4][0] = epoch_loss
                m_best[1][4][1] = epoch + 1
                no_improvements = 0
                if os.path.exists(best_model_full):
                   os.remove(best_model_full)
                   print('@@@@ Val Loss: Previous best Model removed!!!!')
                else:
                   print("@@@@ Val Loss: There is no saved Model yet!!!!")
                torch.save(model.state_dict(), best_model_full)
                print('@@@@ Val Loss: New best Model saved in Epoch: {} !!!!'.format(str(epoch + 1)))
            elif (phase == 'val' and epoch_loss >= m_best[1][4][0]):
                no_improvements+=1
                print('@@@@ Val Loss: NO Improvement!!!!')
            elif (phase == 'train' and epoch_loss < m_best[0][4][0]):
                m_best[0][4][0] = epoch_loss  
                m_best[0][4][1] = epoch + 1 
                print('%%%% Train Loss: Improvement Ok!!!!')
            elif (phase == 'train' and epoch_loss >= m_best[0][4][0]):
                print('%%%% Train Loss: NO Improvement!!!!')
            else:
              print('Invalid option!')   
            
        #### Each epoch has a training and validation phase: End
        epoch+=1
        print()

    #### Main loop: End
    time_elapsed = time.time() - since
    print('Training complete in {:.0f}m {:.0f}s'.format(
        time_elapsed // 60, time_elapsed % 60))
    # Print best values of metrics   
    print('\nBest Training Precision: {:4f} in Epoch: {:4f}'.format(m_best[0][1][0], m_best[0][1][1]))
    print('\nBest Training Recall: {:4f} in Epoch: {:4f}'.format(m_best[0][2][0], m_best[0][2][1]))
    print('\nBest Trainning F1-Score: {:4f} in Epoch: {:4f}'.format(m_best[0][3][0], m_best[0][3][1]))
    print('\nBest Training Accuracy: {:4f} in Epoch: {:4f}'.format(m_best[0][0][0], m_best[0][0][1]))
    print('\nBest Training Loss: {:4f} in Epoch: {:4f}'.format(m_best[0][4][0], m_best[0][4][1]))
    print('#'*10)
    print('\nBest Validation Precision: {:4f} in Epoch: {:4f}'.format(m_best[1][1][0], m_best[1][1][1]))
    print('\nBest Validation Recall: {:4f} in Epoch: {:4f}'.format(m_best[1][2][0], m_best[1][2][1]))
    print('\nBest Validation F1-Score: {:4f} in Epoch: {:4f}'.format(m_best[1][3][0], m_best[1][3][1]))
    print('\nBest Validation Accuracy: {:4f} in Epoch: {:4f}'.format(m_best[1][0][0], m_best[1][0][1]))
    print('\nBest Validation Loss: {:4f} in Epoch: {:4f}'.format(m_best[1][4][0], m_best[1][4][1]))
    # Save best values of metrics
    save_files('train', 'w+', 'bm', output_dir, indic, epoch+1,
               [ [m_best[0][1][0], m_best[0][1][1]], [m_best[0][2][0], m_best[0][2][1]], [m_best[0][3][0], m_best[0][3][1]],
                [m_best[0][0][0], m_best[0][0][1]], [m_best[0][4][0], m_best[0][4][1]] ])
    save_files('val', 'a+', 'bm', output_dir, indic, epoch+1,
               [ [m_best[1][1][0], m_best[1][1][1]], [m_best[1][2][0], m_best[1][2][1]], [m_best[1][3][0], m_best[1][3][1]],
                [m_best[1][0][0], m_best[1][0][1]], [m_best[1][4][0], m_best[1][4][1]] ])
    
    
    
    all_losses_acc.append(train_losses)
    all_losses_acc.append(val_losses)
    all_losses_acc.append(train_acc)
    all_losses_acc.append(val_acc)
    
    return model, all_losses_acc, d_precision, d_recall, d_f1
        

# Inference phase
def test_model_ext(model, crit, dataloaders, dataset_sizes, device, class_names):
    since = time.time()
    # Get user options
    output_dir, bm, indic, extf_dir, n_ext, bs, early_prop, num_epochs = get_user_options_ext()
    # Load the best model
    model.load_state_dict(torch.load(bm))
    was_training = model.training
    print('Testing - was_training: ', was_training)
    model = model.float()
    model.eval()
    
    epoch = 0
    # Dictionaries: truth and preds values
    d_truth = {}
    d_preds = {}
    
    running_loss = 0.0
    running_corrects = 0
    count = 0
    all_y_truth = torch.zeros(4)
    all_y_preds = torch.zeros(4)
    phase = 'test'
    with torch.no_grad():
        #### Iterate over data: Begin
        for i, (inputs, labels, paths) in enumerate(dataloaders[phase]):
            inputs = inputs.to(device)
            labels = labels.to(device)

            # Adding extra ORB features
            ext_data_mat = np.zeros((bs, n_ext))
            for j in range(inputs.size()[0]):
                ext_data = []
                extf_f = extf_dir+phase+'/'+class_names[labels.data[j]]+'/'+short_name(paths[j])+'.txt'
                ext_data = open_files(extf_f)
                ext_data_mat[j] = ext_data
                   
            ext_data_tensor = torch.from_numpy(ext_data_mat)
            ext_data_tensor = ext_data_tensor.to(device)

            outputs = model(inputs.float(), ext_data_tensor.float())
            _, preds = torch.max(outputs, 1)
            loss = crit(outputs, labels)
                        
            count+=1
            running_loss += loss.item() * inputs.size(0)
            running_corrects += torch.sum(preds == labels.data)
                
            if (count == 1):
                  all_y_truth = labels.data.detach().clone()
                  all_y_preds = preds.detach().clone()
            else:
                  all_y_truth=torch.cat((all_y_truth, labels.data), 0) 
                  all_y_preds=torch.cat((all_y_preds, preds), 0) 
                
            d_truth[phase]=all_y_truth
            d_preds[phase]=all_y_preds
           
        #### Iterate over data: End 
        
        test_loss = running_loss / dataset_sizes[phase]
        test_acc = running_corrects.double() / dataset_sizes[phase]
        
        prec, rec, f1, cm = all_metrics(d_truth[phase].cpu(),d_preds[phase].cpu())
        print('Precision: ', prec, ' - Recall: ', rec, ' - F1: ', f1, ' - Conf Matrix: ', cm)
        save_files('test', '-', 'cm', output_dir, indic,epoch+1, cm)
        print("test") 
        time_elapsed = time.time() - since
        print('Testing complete in {:.0f}m {:.0f}s'.format(
        time_elapsed // 60, time_elapsed % 60))
        # Print best values of metrics   
        print('\nTesting Precision: {:4f}'.format(prec))
        print('\nTesting Recall: {:4f}'.format(rec))
        print('\nTesting F1-Score: {:4f}'.format(f1))
        print('\nTesting Accuracy: {:4f}'.format(test_acc))
        print('\nTesting Loss: {:4f}'.format(test_loss))
        print('#'*10)
        
        # Save metrics
        save_files('test', 'w+', 'tm', output_dir, indic, epoch+1,
               [prec, rec, f1, test_acc, test_loss])
        model.train(mode=was_training)
        