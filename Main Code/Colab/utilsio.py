"""
TOrC: Test Oracle based on CNN
----

Author: Valdivino Alexandre de Santiago Júnior

Licence: GNU GENERAL PUBLIC LICENSE, Version 3 (GPLv3)

"""

import numpy as np
import matplotlib.pyplot as plt


def save_files(ph, act, t, dir, ind, ep, data):
  if (t == 'cm'): # confusion matriz
    fcob = open(dir+'/confusion_matrix_' + ind+ '_ep_' + str(ep) +'_' + ph + '.txt',"w+")
    fcob.write('---- Confusion Matrix ----')
    fcob.write('\n Epoch: ' + str(ep))
    fcob.write('\n' + str(data) + '\n')
    fcob.close()
  elif (t == 'me'): # metrics per epoch 
     if (ep == 1): # first epoch: create file
       fcob = open(dir+'/metrics_per_epoch_'+ind+ '_' + ph + '.csv',"w+")
       fcob.write('Epoch,Precision,Recall,F1-Score\n')
     else: # after first, append
       fcob = open(dir+'/metrics_per_epoch_'+ind+ '_' + ph + '.csv',"a+")
     fcob.write(str(ep)+','+str(data[0])+','+str(data[1])+','+str(data[2])+'\n')
     fcob.close() 
  elif ((t == 'bm') or (t == 'bmte')): # best metrics: training/validation or testing eps
    idm = ''
    if (t == 'bm'):
      idm = '/train_val'
    else:
      idm = '/test_eps'  
    fcob = open(dir+idm+'_best_metrics_'+ind+'.txt', act)
    fcob.write('Best ' + ph + ' Precision: ' + str(data[0][0]) + ' in Epoch: ' + str(data[0][1])+'\n')
    fcob.write('#################################\n')
    fcob.write('Best ' + ph + ' Recall: ' + str(data[1][0]) + ' in Epoch: ' + str(data[1][1])+'\n')
    fcob.write('#################################\n')
    fcob.write('Best ' + ph + ' F1-Score: ' + str(data[2][0]) +' in Epoch: ' + str(data[2][1])+'\n')
    fcob.write('#################################\n')
    fcob.write('Best ' + ph + ' Accuracy: ' + str(data[3][0]) + ' in Epoch: ' + str(data[3][1])+'\n')
    fcob.write('#################################\n')
    fcob.write('Best ' + ph + ' Loss: ' + str(data[4][0]) + ' in Epoch: ' + str(data[4][1])+'\n')
    
    fcob.write('---------------------------------\n')
    fcob.write('---------------------------------\n')
    #fcob.write('Best Training Accuracy: ' + str(data[4][0]) + ' in Epoch: ' + str(data[4][1])+'\n')
    fcob.close()
  elif (t == 'tm'): # metrics: testing single
    fcob = open(dir+'/test_metrics_'+ind+'.txt', act)
    fcob.write(ph + ' Precision: ' + str(data[0]) + '\n')
    fcob.write('#################################\n')
    fcob.write(ph + ' Recall: ' + str(data[1]) + '\n')
    fcob.write('#################################\n')
    fcob.write(ph + ' F1-Score: ' + str(data[2]) + '\n')
    fcob.write('#################################\n')
    fcob.write(ph + ' Accuracy: ' + str(data[3]) + '\n')
    fcob.write('#################################\n')
    fcob.write(ph + ' Loss: ' + str(data[4]) + '\n')
    fcob.write('---------------------------------\n')
    fcob.write('---------------------------------\n')
    #fcob.write('Best Training Accuracy: ' + str(data[4][0]) + ' in Epoch: ' + str(data[4][1])+'\n')
    fcob.close()
  else:
    print('Invalid Option!')



def open_files(name):
        
   with open(name) as f:
    w = [float(x) for x in next(f).split()] # read first line
    array = np.empty((0,1), float) #array=[]
    array = w
    for line in f: # read rest of lines
        array = np.append(array, [float(x) for x in line.split()], axis=0)
        #array.append([int(x) for x in line.split()])
   
    #print('Ext File info: {} - {}'.format(len(array), type(array)))
   
    return array


def short_name(s):
    ind=s.rfind("/")
    new_s=s[ind+1:-4]
    return new_s


def save_files_class(dir, m, ind, lm, lc):
  fcob = open(dir+'/'+m+'_'+ind+'.txt',"w+")
  fcob.write('@@@@ Misclassified Images @@@@\n')
  for k in lm:
    fcob.write(k+'\n')
  fcob.write('--------------------\n')
  fcob.write('--------------------\n')
  fcob.write('@@@@ Correctly Classified Images @@@@\n')
  for k in lc:
    fcob.write(k+'\n')  
  fcob.close() 
  

def save_user_options(out_dir, best_model, ind, early_prop, n_epoch):
    f = open('user_options.txt',"w+")
    f.write(out_dir+'\n')
    f.write(best_model+'\n')
    f.write(ind+'\n')
    f.write(str(early_prop)+'\n')
    f.write(str(n_epoch)+'\n')
    f.close()
    
def save_user_options_ext(out_dir, best_model, ind, extf_dir, n_ext, bs, early_prop, n_epoch):
    f = open('user_options.txt',"w+")
    f.write(out_dir+'\n')
    f.write(best_model+'\n')
    f.write(ind+'\n')
    f.write(extf_dir+'\n')
    f.write(str(n_ext)+'\n')
    f.write(str(bs)+'\n')
    f.write(str(early_prop)+'\n')
    f.write(str(n_epoch)+'\n')
    f.close()    

    
def get_user_options():
    with open('user_options.txt') as f:
        j = 1
        for line in f:
            if j == 1:
                o_dir = line
            elif j == 2:
                b_model = line
            elif j == 3:
                i = line
            elif j == 4:
                early_aux = line
                early_aux = early_aux.rstrip("\n")
                early = float(early_aux)   
            elif j == 5:
                n_epoch_aux = line
                n_epoch_aux = n_epoch_aux.rstrip("\n")
                n_epoch = int(n_epoch_aux)      
            else:
                print('Invalid option!')
            j+=1   
    f.close()  
    
    o_dir = o_dir.rstrip("\n")
    b_model = b_model.rstrip("\n")
    i = i.rstrip("\n")
    
    return o_dir, b_model, i, early, n_epoch  

def get_user_options_ext():
    with open('user_options.txt') as f:
        j = 1
        for line in f:
            if j == 1:
                o_dir = line
            elif j == 2:
                b_model = line
            elif j == 3:
                i = line
            elif j == 4:
                e_dir = line
            elif j == 5:
                n_ex_aux = line
                n_ex_aux = n_ex_aux.rstrip("\n")
                n_ex = int(n_ex_aux)
            elif j == 6:
                bat_aux = line
                bat_aux = bat_aux.rstrip("\n")
                bat = int(bat_aux)
            elif j == 7:
                early_aux = line
                early_aux = early_aux.rstrip("\n")
                early = float(early_aux)   
            elif j == 8:
                n_epoch_aux = line
                n_epoch_aux = n_epoch_aux.rstrip("\n")
                n_epoch = int(n_epoch_aux)       
            else:
                print('Invalid option!')
            j+=1   
    f.close()  
    
    o_dir = o_dir.rstrip("\n")
    b_model = b_model.rstrip("\n")
    i = i.rstrip("\n")
    e_dir = e_dir.rstrip("\n")
        
    return o_dir, b_model, i, e_dir, n_ex, bat, early, n_epoch      


def plot_training_metrics(all_losses_acc, d_precision, d_recall, d_f1):
    
    output_dir, best_model, indic, early_prop, num_epochs = get_user_options()
    x = range(1,len(d_precision['train'])+1)

    plt.figure(figsize=(10,5))
    plt.title("Training and Validation Losses")
    #plt.plot(x,train_losses,label="TrLoss")
    #plt.plot(x,val_losses,label="ValLoss")
    plt.plot(x,all_losses_acc[0],label="TrLoss")
    plt.plot(x,all_losses_acc[1],label="ValLoss")
    plt.xticks(range(1,len(x)+1))
    plt.xlabel("Epochs")
    plt.ylabel("Loss")
    plt.legend()
    plt.savefig(f"{output_dir}/loss_"+indic+".png")
    plt.show()

    plt.figure(figsize=(10,5))
    plt.title("Training and Validation Accuracy")
    #plt.plot(x,train_acc,label="TrAcc")
    #plt.plot(x,val_acc,label="ValAcc")
    plt.plot(x,all_losses_acc[2],label="TrAcc")
    plt.plot(x,all_losses_acc[3],label="ValAcc")
    plt.xticks(range(1,len(x)+1))
    plt.xlabel("Epochs")
    plt.ylabel("Accuracy")
    plt.legend()
    plt.savefig(f"{output_dir}/accuracy_"+indic+".png")
    plt.show()

    plt.figure(figsize=(10,5))
    plt.title("Training: Precision, Recall, F1-Score")
    plt.plot(x,d_precision['train'],label="Prec")
    plt.plot(x,d_recall['train'],label="Rec")
    plt.plot(x,d_f1['train'],label="F1")
    plt.xticks(range(1,len(x)+1))
    plt.xlabel("Epochs")
    plt.ylabel("Metrics")
    plt.legend()
    plt.savefig(f"{output_dir}/prf_"+indic+"_train.png")
    plt.show()

    plt.figure(figsize=(10,5))
    plt.title("Validation: Precision, Recall, F1-Score")
    plt.plot(x,d_precision['val'],label="Prec")
    plt.plot(x,d_recall['val'],label="Rec")
    plt.plot(x,d_f1['val'],label="F1")
    plt.xticks(range(1,len(x)+1))
    plt.xlabel("Epochs")
    plt.ylabel("Metrics")
    plt.legend()
    plt.savefig(f"{output_dir}/prf_"+indic+"_val.png")
    plt.show()


def plot_training_metrics_ext(all_losses_acc, d_precision, d_recall, d_f1):
    
    output_dir, best_model, indic, extf_dir, n_ext, bs, early_prop, num_epochs = get_user_options_ext()
    x = range(1,len(d_precision['train'])+1)

    plt.figure(figsize=(10,5))
    plt.title("Training and Validation Losses")
    #plt.plot(x,train_losses,label="TrLoss")
    #plt.plot(x,val_losses,label="ValLoss")
    plt.plot(x,all_losses_acc[0],label="TrLoss")
    plt.plot(x,all_losses_acc[1],label="ValLoss")
    plt.xticks(range(1,len(x)+1))
    plt.xlabel("Epochs")
    plt.ylabel("Loss")
    plt.legend()
    plt.savefig(f"{output_dir}/loss_"+indic+".png")
    plt.show()

    plt.figure(figsize=(10,5))
    plt.title("Training and Validation Accuracy")
    #plt.plot(x,train_acc,label="TrAcc")
    #plt.plot(x,val_acc,label="ValAcc")
    plt.plot(x,all_losses_acc[2],label="TrAcc")
    plt.plot(x,all_losses_acc[3],label="ValAcc")
    plt.xticks(range(1,len(x)+1))
    plt.xlabel("Epochs")
    plt.ylabel("Accuracy")
    plt.legend()
    plt.savefig(f"{output_dir}/accuracy_"+indic+".png")
    plt.show()

    plt.figure(figsize=(10,5))
    plt.title("Training: Precision, Recall, F1-Score")
    plt.plot(x,d_precision['train'],label="Prec")
    plt.plot(x,d_recall['train'],label="Rec")
    plt.plot(x,d_f1['train'],label="F1")
    plt.xticks(range(1,len(x)+1))
    plt.xlabel("Epochs")
    plt.ylabel("Metrics")
    plt.legend()
    plt.savefig(f"{output_dir}/prf_"+indic+"_train.png")
    plt.show()

    plt.figure(figsize=(10,5))
    plt.title("Validation: Precision, Recall, F1-Score")
    plt.plot(x,d_precision['val'],label="Prec")
    plt.plot(x,d_recall['val'],label="Rec")
    plt.plot(x,d_f1['val'],label="F1")
    plt.xticks(range(1,len(x)+1))
    plt.xlabel("Epochs")
    plt.ylabel("Metrics")
    plt.legend()
    plt.savefig(f"{output_dir}/prf_"+indic+"_val.png")
    plt.show()
