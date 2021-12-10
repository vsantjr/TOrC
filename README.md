# TOrC: Supplemental Material

Article: A Method and Experiment to evaluate Deep Neural Networks as
Test Oracles for Scientific Software

In this repository, there are all relevant files for the abovementioned article. They are related to the **Test Oracle based on CNN** (TOrC) method and the controlled experiment described in the article. The contents of each folder is as follows.


## Datasets


All training, validation, and test datasets as well as Oriented FAST and Rotated
BRIEF (ORB) descriptors for both dataset profiles, Total Dissimilar (TD) and Some Similarity (SS), are in this folder. 

## Main Code

This folder has the codes to support the main part that implements the TOrC method. Note that we extended a [PyTorch tutorial on transfer learning](https://pytorch.org/tutorials/beginner/transfer\_learning\_tutorial.html). It has two subfolders: *Colab* and *Machine*. If you have a machine with GPU, it is highly recommended to run the programs in the *Machine* subfolder.

*Colab*: Google Colab notebooks to support execution via cloud. Note that there is one notebook for each architecture configuration: Transfer Layer (TL), one Extra Layer (TLE1L), and two Extra Layers (TLE2L). Moreover, it is required to select GPU to properly run the notebooks. There also some *library* files (.py). Just add all files in the same Google Drive directory and follow the instructions in the notebook.

*Machine*: These programs assume one has a machine (desktop, notebook) with GPU. In this case, there is one Python code for each architecture configuration (TL, TLE1L, TLE2L) and the *library* files (.py) too. Add all files in the same directory in your machine and also run in the command line:
```
python TOrC_<c>_Alt.py <m> <p> <candp>
```

where:

`<c>`: architecture configuration. It can assume the following values: TL, TLE1L, TLE2L;

`<m>`: number representing the model (CNN). It can assume the following values:

- 1 = ResNet-18;
- 2 = ResNet-34;
- 3 = ResNeXt-50-32x4d;
- 4 = Wide ResNet-50-2;
- 5 = Inception v3;
- 6 = ResNet-152;
- 7 = DenseNet-161;

`<p>`: number representing the dataset profile. It can assume the following values:

- 1 = TD;
- 2 = SS;

`candp`: string with option combining architecture configuration and dataset profile. It can assume the following values:

- 0t = TL architecture and TD profile;
- 0s = TL architecture and SS profile;
- 1t = TLE1L architecture and TD profile;
- 1s = TLE1L architecture and SS profile;
- 2t = TLE2L architecture and TD profile;
- 2s = TLE2L architecture and SS profile.
 

As an example, here is the command line to run the DenseNet-161 model, with the TLE1L architecture and TD profile:
```
python TOrC_TLE1L_Alt.py 7 1 1t 
```

And to run the ResNet-18 model, with TLE2L architecture and SS profile:
```
python TOrC_TLE2L_Alt.py 1 2 2s
```


## Miscellaneous

This folder contains additional processing required to support the implementation of the TOrC method and also related to the experimental evaluation:

- `selectdata_structuralsimilarity.ipynb`.  Part of the implementation of the Select Data task of the TOrC method. It relies on structural similarity to devise sets with the most dissimilar images in order to have more representative samples and avoid data redundancy;

- `arch_conf_ORB.py`. It supports the creation of the architecture configurations with extra layers (TLE1L, TLE2L), by extracting image feature elements via the detector and description algorithm ORB;

- `TOrC_apriori.py`. Association rule algorithm (apriori) analysis. The .csv files are input to this program where `input_apriori_correct` has all the test images correctly classified and `input_apriori_misclassified` has all the test images which were misclassified.  

## Results

In this folder, there are subflders with the most important results for all combinations of models (CNNs), dataset profiles, and architecture configurations, including:

- plots of metrics obtained by the CNNs (accuracy, loss, precision, recall, F1-score) considering the training and validation datasets during the training phase;
- reports of the misclassified and correctly classified images of the test dataset as well as of the training and validation datasets;
- confusion matrices considering the test dataset as well as taking into account the epoch in which the best training and validation losses happened during the training phase;
- metrics obtained by the CNNs (precision, recall, F1-score) for each epoch considering the training and validation datasets during the training phase;
- best metrics obtained by the CNNs considering the training and validation datasets during the training phase;
- metrics obtained by the CNNs considering the test dataset during the inference phase.

## Scientific Models

In this folder, there are all the correct and mutated scientific models/programs used in this research. Note that in each program, the function `get_tuple` contains the tuples suggested by the TTR algorithm (run externally). Each tuple is passed to `sel_values` which has the real values of the parameters of the scientific model. In order to run the code to generate the images, install the [TerraME environment](https://github.com/TerraME/terrame/releases) and run from the command line:
```
terrame name_of_program.lua 
```
Given the non-deterministic nature of some of the scientific models, two different simulations, with the same values of parameters, may produce different images and, eventually, they may be different from the ones in the datasets created in this research. There are three subfolders:

- *TD\_Training-Validation*: programs to create the training and validation datasets considering the TD profile;
-  *SS\_Training*:  programs to create the training dataset considering the SS profile. Here, we repeat all the programs from the subfolder above just for completeness since we maintain all training images from the TD profile. Hence, the folder *Test New Images* contains the codes to create new test images to be added into the training dataset. In SS, the validation dataset is the same as in TD;
-  *TD-SS\_Test*: In both profiles, TD and SS, the test set is the same and the programs are in this subfolder. Recall that the images in this subfolder are completely different from the ones in the subfolder *Test New Images* above.

## Author

[**Valdivino Alexandre de Santiago J&uacute;nior**](https://www.linkedin.com/in/valdivino-alexandre-de-santiago-j%C3%BAnior-103109206/?locale=en_US)

## Licence

This project is licensed under the GNU GENERAL PUBLIC LICENSE, Version 3 (GPLv3) - see the [LICENSE](LICENSE) file for details.

## Reference

V. A. Santiago J&uacute;nior. A Method and Experiment to evaluate Deep Neural Networks as Test Oracles for Scientific Software. Submitted to: The 3rd ACM/IEEE International Conference on Automation of Software Test (AST 2022).
