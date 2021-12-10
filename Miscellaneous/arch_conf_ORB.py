
"""
Author: Valdivino Alexandre de Santiago Júnior 

Licence: GNU GENERAL PUBLIC LICENSE, Version 3 (GPLv3)

This code is part of the implementation of the Test Oracle based on CNN (TOrC). It supports the creation of the architecture configurations with Extra Layers (TLE1L, TLE2L), by extracting image feature elements via the detector and description algorithm Oriented FAST and Rotated BRIEF (ORB) (https://ieeexplore.ieee.org/document/6126544). 
"""

import numpy as np
import cv2 as cv
from matplotlib import pyplot as plt
import glob
import os

"""
Auxiliary functions to handle files.
"""

def short_name(s):
    ind=s.rfind("/")
    new_s=s[ind+1:-4]
    return new_s
 
def open_files(name):
        
   with open(name+'.txt') as f:
    w = [int(x) for x in next(f).split()] 
    array = np.empty((0,1), int) 
    array = w
    for line in f: 
        array = np.append(array, [int(x) for x in line.split()], axis=0)
        
   print(len(array), type(array))
   f.close()
   return array

def save_files(data, name):
    with open(name+'.txt','wb') as file:
      for line in data:
        np.savetxt(file, line, fmt='%.8f')
    
    file.close()
    print('length ' + name + ' :', len(data))
    print('#######################################################\n\n')

    
"""
Run the main code. Output directories are:
    - output_dir: non-normalised descriptors elements;
    - output_dir_norm: normalised descriptors elements;
    - output_dir_images: images with the keypoints.
"""   

input_dir = './input/'

output_dir = "./output/"
output_dir_norm = "./outputnorm/"
output_dir_img = "./outputimg/"

"""
Both the input and output directories are assumed to have the following subdirectory structure
within each directory:
    
    test
        correct
        mutantd
    train
        correct
        mutantd
    val
        correct
        mutantd

In the case of the input directory, images must be placed in the respective
subdirectories beforehand. The code below creates the subdirectory structure for 
all output directories.
"""

sub_dir = ['test/correct/', 'test/mutantd/', 'train/correct/', 'train/mutantd/', 'val/correct/', 'val/mutantd/']
for d in range(6):
  try:
    os.makedirs(output_dir+sub_dir[d])
  except OSError:
    print ("Creation of the directory %s failed" % output_dir)
  else:
    print ("Successfully created the directory %s" % output_dir)
    
  try:
    os.makedirs(output_dir_img+sub_dir[d])
  except OSError:
    print ("Creation of the directory %s failed" % output_dir_img)
  else:
    print ("Successfully created the directory %s" % output_dir_img)  
    
  try:
    os.makedirs(output_dir_norm+sub_dir[d])
  except OSError:
    print ("Creation of the directory %s failed" % output_dir_norm)
  else:
    print ("Successfully created the directory %s" % output_dir_norm)   

"""
Get all files in each subdirectory and find the descriptors.
"""

for s in sub_dir:
   
  print('Dir Full: ', input_dir+s)
  print('@'*20)  
  
  for f in glob.iglob(input_dir+s+"*.*"):
    image = []
    img = []
    img2 = []
    
    # Read the images in greyscale.     
    image = cv.imread(f,0)
    h = image.shape[0]
    w = image.shape[1]
    
    # Center = image.shape / 2
    x = round(w - w/2)
    y = round(h - h/2)
    
    # Crop twice the dimensions of the image.
    crop_dim = 224 
    print('Center: ({}, {})'.format(x, y))
    img = image[int(y-crop_dim):int(y+crop_dim), int(x-crop_dim):int(x+crop_dim)]
        
    print('Dir: {} - Image Short Name {}: '.format(s,short_name(f)))
    # Initialise ORB detector.
    orb = cv.ORB_create()
    # Find the keypoints with ORB.
    kp = orb.detect(img,None)
    # Compute the descriptors with ORB.
    kp, des = orb.compute(img, kp)
    
    sel_des = []
    n_rows_sel = 32
    i_ran = [] 
    
    if isinstance(des, type(None)):
      sel_des = np.zeros((n_rows_sel, 32))
      print('New none!')
      print(len(sel_des), len(sel_des[0]))
    else:
      nr=des.shape[0]
      if (nr < n_rows_sel):
         sel_des = des
         sel_des = np.append(sel_des, np.zeros((n_rows_sel - nr, 32)), axis=0)
         print('Less than number of sel rows!')
      else:   
         i_ran=np.random.choice(nr, n_rows_sel, replace=False) 
         sel_des=des[i_ran, :]
         print('Greater than number of sel rows!')
         
    print('----')
    print(len(sel_des), len(sel_des[0]))
    
    """
    Save descriptors elements: not normalised.
    """
    save_files(sel_des, output_dir+s+short_name(f))   
    
    sel_des_norm = []
    sel_des_mean = np.mean(sel_des)
    sel_des_std = np.std(sel_des)
    print('Mean: {:4f} - Std: {:4f}'.format(sel_des_mean,sel_des_std))
    if (sel_des_mean != 0):
      sel_des_norm = (sel_des - sel_des_mean)/sel_des_std
    else:
        sel_des_norm = sel_des
    
    """
    Save descriptors elements: normalised.
    """
    save_files(sel_des_norm, output_dir_norm+s+short_name(f))
    
    """
    Save the images with only keypoints location, not size nor orientation.
    """
    img2 = cv.drawKeypoints(img, kp, None, color=(0,255,0), flags=0)
    plt.imsave(f"{output_dir_img}/"+s+short_name(f)+".png",img2)
    print('@'*50)    