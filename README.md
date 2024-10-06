![DenD](https://img.shields.io/badge/Project-DengueDrug-lightblue) 
[![Open In Collab](https://colab.research.google.com/assets/colab-badge.svg)](xxxxxx)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) 
![GitHub Repo stars](https://img.shields.io/github/stars/omicscodeathon/denguedrug)
[![Github all releases](https://img.shields.io/github/downloads/omicscodeathon/denguedrug/total.svg)](https://GitHub.com/omicscodeathon/denguedrug/releases/)
![Python](https://img.shields.io/badge/python-3.12-blue.svg)
[![GitHub contributors](https://img.shields.io/github/contributors/omicscodeathon/denguedrug.svg)](https://GitHub.com/omicscodeathon/denguedrug/graphs/contributors/)
[![Github tag](https://badgen.net/github/tag/omicscodeathon/denguedrug)](https://github.com/omicscodeathon/denguedrug/tags/)

# denguedrug
**Machine Learning and Molecular Docking Prediction of Potential Inhibitors against Dengue Virus**

## Overview 
<p align="justify">
  In this project, we are building a <i>in silico</i> pipeline to identify novel dengue virus inhibitors. We will incorporate Deep/Machine Learning (DL/ML) and molecular modeling techniques into the pipeline.
</p>

<p align="justify">
  Dengue virus (DENV) is a <i>Flaviviridae</i> family member responsible for the most prevalent mosquito-borne viral hemorrhagic fever. Dengue virus transmission to humans primarily occurs through mosquito bites from species such as <i>Aedes aegypti</i> and <i>Aedes albopictus</i>, widespread in tropical and subtropical climates, including both urban and rural regions. The severe and sometimes fatal diseases known as Dengue hemorrhagic fever (DHF) and Dengue shock syndrome (DSS) can develop in certain people infected with DENV. The spread of dengue fever has resulted in several medical emergencies and deaths for which no drug is currently available. Despite its prevalence, the treatment administered is symptomatic. The structural information available for the DENV presented an opportunity to discover potent antiviral agents capable of disrupting the early stages of DENV infection. 
Our approach seeks to train different machine learning models using the Anti-Dengue dataset from PubChem to distinguish between potential anti-Dengue compounds and non-anti-Dengue compounds. Subsequently, we will further screen the predicted compounds against a Dengue protein target for downstream analysis. Details of the pipeline can be found in the workflow below.
</p>

<p align="justify">
  Please <a href="https://x.com/natfriedman/status/1420122675813441540/photo/1">cite</a> and <a href="https://docs.github.com/en/get-started/exploring-projects-on-github/saving-repositories-with-stars">star</a> the repository if you utilize the pipeline for research or commercial purposes.
</p>


## Table of contents
1. [Objectives](#objectives)
2. [Description](#description)
   - [Identification of Dengue Virus inhibitors database for ML training](#step-1-identification-of-dengue-virus-inhibitors-database-for-ml-training)
   - [Preprocessing](#step-2-preprocessing)
   - [Model construction](#step-3-model-construction)
   - [Prediction](#step-4-prediction)
   - [Molecular Docking](#step-5-molecular-docking)
   - [ADMET prediction](#step-6-admet-prediction)
   - [Molecular Dynamics (MD) Simulations](#step-7-molecular-dynamics-md-simulations)
3. [Manuscript](#manuscript)
4. [Results](#results)
   - [Data Acquisition and Processing](#data-acquisition-and-processing)
   - [Model Development and Evaluation](#model-development-and-evaluation)
   - [Prediction of Inhibitors and Compounds](#prediction-of-inhibitors-and-new-compounds)
   - [Target Selection and Molecular Docking of Predicted Compounds](#target-selection-and-molecular-docking-of-predicted-compounds)
   - [Mechanism of Binding Characterization of Selected Compounds](#mechanism-of-binding-characterization-of-selected-compounds)
   - [ADMET Screening of Selected Compounds](#admet-screening-of-selected-compounds)
   - [Molecular Dynamics Simulations](#molecular-dynamics-simulations)
   - [MMPBSA Computations](#mmpbsa-computations)
5. [How to use](#how-to-use)
6. [Data Availability](#data-availability)
7. [Reproducibility Prerequisites](#reproducibility-prerequisites)
8. [Credits](#credits)

## Objectives
- [X] Identify the Dengue virus protein target.
- [X] Identify Dengue virus ligand database for ML training and molecular modeling method validation.
- [X] Determine ML algorithm to be utilized in the project.
- [X] Process ligand database and train ML model.
- [X] Evaluate ML performance.
- [X] Validate molecular modeling method using prepared ligand database (Actives vs Non-actives).
- [X] Virtual screening of predicted actives into identified protein crystal structures.
- [X] Assess and identify hits using criterion: docking score, interactions with important residues.
- [ ] Assess hits ADMET properties.
- [ ] Conduct MD simulations to determine compounds' binding mode stability and binding free energy. 

## Description

<p align="center">
  <br>
  <font size="1">
  The figure illustrates the proposed DengueDrug pipeline to be utilized to identify Dengue Virus Inhibitors.</a>
   <br><br>
  </font> 
  <img src="workflow/DengueDrug%20project%20workflow%20diagram.png" alt="Proposed Dengue Drug Identification Pipeline" title="Proposed Dengue Drug Identification Pipeline" width="800"/>
  <br>
  <font size="1">
  <b>Proposed Dengue Drug Identification Pipeline</b>
  </font>
</p>

### Step 1: Identification of Dengue Virus inhibitors database for ML training

<p align="justify">
  The ligand database was obtained from PubChem <a href="https://pubchem.ncbi.nlm.nih.gov/bioassay/651640">BioAssay ID: 651640</a>. The ligand database was experimentally generated using (<i>in vivo</i>) DENV2 CPE-Based HTS Measured in Cell-Based and Microorganism Combination System method by the <a href="http://www.broadinstitute.org/">Broad Institute</a>. A total of 347,136 compounds were analyzed for their Dengue Virus inhibition and 5,946 actives and 324,845 non-actives were identified. An active is represented as a compound that can exhibit an ATP activity level above 20% at 10 $\mu M$.
</p>

### Step 2: Preprocessing

 - The unprocessed database can be found [here](data/unprocessed_database_PubChem_651640).

 - The molecular descriptors of the actives and inactives were calculated using [PaDEL-Descriptors](http://www.yapcwsoft.com/dd/padeldescriptor/). The descriptors of the [actives and inactives](data) were calculated using the [Descriptor Calculator](scripts/DescriptorCalculator.py) Python script.

 - The actives and inactives databases were combined and all missing descriptors were filled with the value 0. Next dimensionality reduction was conducted using a variance filter (scikit-learn VarianceThreshold library)

 - The data was then standardized using the mean and standard deviation [metrics](data/metrics.csv)

### Step 3: Model construction

- The data was split into training, test, and external datasets. The training dataset was equivalent to 70% (14875 compounds) of the data set and the test and external data sets were equivalent to 15% (~3188) each. The training dataset contained 3105 actives vs 11770 inactives.

- The ML models were constructed using [lazy predict](https://github.com/shankarpandala/lazypredict) python package. The models that exhibited the greatest Accuracy, F1-score, Balanced Accuracy, and ROC AUC [metrics](figures/Lazy_predict_results.jpeg) were selected for validation.

- <p align="justify">The models chosen for further validation were K-Nearest Neighbours, Naive Bayes, Support Vector Machine, Random Forest and Logistic regression. The models can be found <a href="output/models">here</a>. Using K-fold splitting of the training data the models were cross-validated and the model's suitability was evaluated using the Accuracy, F1-score, Precision, Recall, and Specificity, and false and true positive and negative rate <a href="ML_results_for_model_selection.jpeg">metrics</a>.</p>

- The models' prediction ability was assessed using the test data. The model's prediction accuracy was determined using Accuracy, F1-score, Precision, and Recall [metrics](figures/Model_selection_results_on_test_dataset.png).

- The logistic regression (LR) model exhibited the greatest results on the test dataset and therefore was evaluated on the external dataset. The LR model obtained an 82% active and 98% inactive accuracy.

### Step 4: Prediction

- <p align="justify">The LR model was employed to screen the <a href="https://african-compounds.org/about/nanpdb/">Northern African Natural Products Database (NANPD)</a>, <a href="https://african-compounds.org/about/eanpdb/">East African Natural Products Database (EANPD)</a>, <a href="https://african-compounds.org/about/afrodb/">AfroDB</a> and <a href="http://tcm.cmu.edu.tw/about01.php?menuid=1">Tradtional Chinese Medicine (TCM) database</a>.</p>

- The natural compounds' chemical structures were prepared similarly to the training dataset and ~43,000 compounds were screened using the LR model.

- 7,722 compounds were predicted to be active and subsequently utilized for molecular docking

### Step 5: Molecular Docking

- The crystal structure of the dengue 2 virus envelope protein ([PDB: 10KE](https://doi.org/10.2210/pdb1OKE/pdb)) was identified for structure-based virtual screening.

- [AutoDock Vina](https://vina.scripps.edu) was utilized to screen the 7,722 compounds into the dengue 2 virus envelope protein.

- The potential hits were selected using the criterion:
  - AutoDock Vina binding score
  - Presence of binding interactions between important binding site residues and ligand (LigPlot + v1.4.5).
 
### Step 6: ADMET prediction

- The ADMET properties of the identified hits will be predicted using [SwissADME](http://www.swissadme.ch).
- The hits with potential pharmacokinetic and toxicity moieties will be removed.

### Step 7: Molecular Dynamics (MD) Simulations

- The hits binding mode stability will be assessed through 100-nanosecond (ns) MD simulations utilizing GROMACS.
- The stability will be assessed using metrics like root-mean-square deviation (RMSD) and fluctuation (RMSF), Radius of Gyration, etc.
- The compounds binding interactions retention with important residues throughout the MD simulations will be assessed with the [ProLIF](https://prolif.readthedocs.io/en/stable/) python library.
- The compounds' binding free energies throughout the MD simulation were calculated using Molecular Mechanics Poisson-Boltzmann Surface Area (MMPBSA).

## Manuscript

<p align="justify">When using the pipeline or findings for research or commercial purposes please <a href="https://x.com/natfriedman/status/1420122675813441540/photo/1">cite</a> our research.</p>

## Results

<p align="justify">
  From the various analyses and computations performed throughout this <i>in silico</i> exploration, the following results were obtained and observations made.
</p>

---

### Data Acquisition and Processing

<p align="justify">
  The bioactive dataset obtained from PubChem consisted of imbalanced data from which 1/3 where active compounds. As shown below, inactive compounds dominated the dataset. Using PaDEL, 1,444 molecular descriptors were generated, providing a mathematical representation of the compounds for QSAR modeling by converting chemical information about the compounds into numerical values. The dataset of 21,250 compounds was split into training, validation, and test sets as follows: 14,875 training data, 3,187 test data, and 3,188 externally held data. Applying a variance filter reduced the number of descriptors from 1,444 to 684 using a variance threshold of 0.1 to filter out descriptors with minimal variance, ensuring that only the most informative features were retained for subsequent modeling. 
</p>
<p align="center">
  <br>
  </font> 
  <img src="figures/Correlation%20between%20actives%20and%20inactives%20from%20ML_legend.jpeg" title="Three-dimensional plot showing the correlation between the active and inactive compounds from the processed data based on ALogP, XLogP, and Zagreb" width="650"/>
  <br>
  <font size="1">
  <b>3D plot showing the correlation between the active and inactive compounds based on ALogP, XLogP, and Zagreb.</b>
  </font>
</p>

---

### Model Development and Evaluation

<p align="justify">
 Five machine learning algorithms (k-NN, Gaussian Naïve Bayes, SVM, Random Forest, and Logistic Regression) were employed to build robust predictive models, each assessed based on several statistical parameters including accuracy, precision, recall, and F1 score. LR produced the best results across most metrics, followed by the SVM model. The results of each model's performance are shown below.
</p>
  
| Model | Accuracy | Precision | Recall | F1 Score |
| :---- | :------: | :-------: | :----: | :------: |
| LR    | 0.94     | 0.91      | 0.76   | 0.83     |
| SVM   | 0.93     | 0.94      | 0.71   | 0.81     |
| KNN   | 0.92     | 0.89      | 0.68   | 0.77     |
| RF    | 0.91     | 0.94      | 0.60   | 0.73     |
| NB    | 0.81     | 0.55      | 0.47   | 0.51     |

<p align="center">
  <br>
  </font> 
  <img src="figures/ML_Val_Results.jpeg" title="Bar plot of model performance of each model based on accuracy, precision, recall, and F1 score" width="800"/>
  <br>
  <font size="1">
  <b>Bar plot of model performance of each model based on statistical evaluation parameters.</b>
  </font>
</p>

---

### Prediction of Inhibitors and New Compounds 

<p align="justify">
  18 known Dengue Virus inhibitors retrieved from literature were used for initial testing and further validation of the model performance. The Logistic Regression model predicted 11 of these inhibitors as active, outperforming the other models. Preprocessing of these compounds was conducted in the same manner as the training data to commence the prediction of the new compounds, ensuring consistency in descriptor calculation and transformation. The Logistic Regression model was employed to predict 812 compounds from the ZINC database and 1871 from the EANPDB database. The predictions aimed to identify new, promising compounds that could act as Dengue Virus inhibitors, expanding the pool of potential candidates for further validation.  A total of 933 out of the 2683 were predicted to be active by the logistic regression model.
</p>

---

### Target Selection and Molecular Docking of Predicted Compounds

<p align="justify">
  When using the pipeline or findings for research or commercial purposes please <a href="https://x.com/natfriedman/status/1420122675813441540/photo/1">cite</a> our research.
</p>

-----

### Mechanism of Binding Characterization of selected compounds

<p align="justify">
  When using the pipeline or findings for research or commercial purposes please <a href="https://x.com/natfriedman/status/1420122675813441540/photo/1">cite</a> our research.
</p>

-----

### ADMET Screening of Selected Compounds

<p align="justify">
  When using the pipeline or findings for research or commercial purposes please <a href="https://x.com/natfriedman/status/1420122675813441540/photo/1">cite</a> our research.
</p>

------

### Molecular Dynamics Simulations

<p align="justify">
  When using the pipeline or findings for research or commercial purposes please <a href="https://x.com/natfriedman/status/1420122675813441540/photo/1">cite</a> our research.
</p>

#### Root mean square deviation (RMSD) for 100 ns MD simulations

<p align="justify">
  When using the pipeline or findings for research or commercial purposes please <a href="https://x.com/natfriedman/status/1420122675813441540/photo/1">cite</a> our research.
</p>

#### Radius of gyration for 100 ns MD simulations

<p align="justify">
  When using the pipeline or findings for research or commercial purposes please <a href="https://x.com/natfriedman/status/1420122675813441540/photo/1">cite</a> our research.
</p>

#### Root mean square fluctuations (RMSF) for 100 ns MD simulations

<p align="justify">
  When using the pipeline or findings for research or commercial purposes please <a href="https://x.com/natfriedman/status/1420122675813441540/photo/1">cite</a> our research.
</p>

------

### MMPBSA Computations

<p align="justify">
  When using the pipeline or findings for research or commercial purposes please <a href="https://x.com/natfriedman/status/1420122675813441540/photo/1">cite</a> our research.
</p>

#### Contributing Energy Terms 

<p align="justify">
  When using the pipeline or findings for research or commercial purposes please <a href="https://x.com/natfriedman/status/1420122675813441540/photo/1">cite</a> our research.
</p>

#### Per-residue Energy Decomposition

<p align="justify">
  When using the pipeline or findings for research or commercial purposes please <a href="https://x.com/natfriedman/status/1420122675813441540/photo/1">cite</a> our research.
</p>

-------

## How to use

<p align="justify">The <a href="docs">documentation</a> and <a href="notebooks">tutorial</a> give a general overview of how the [pipeline](pipeline/README.md) can be utilized to identify novel Dengue Virus inhibitors.</p>

**Tutorial 1**

[ML pipeline](notebooks/ML_Dengue.ipynb) describes how the models were constructed, validated and selected.

**Tutorial 2**

Molecular docking and dynamics

## Data Availability

The data utilized for the project can be found [here](data).

## Reproducibility Prerequisites

<p align="justify">The codes and scripts were run on Python 3.8, Anaconda xx and Jupyter Notebook version xx. R version 4.3.0 was used for some of the data visualization.</p>

## Credits

**The Team members include:**
1. George Hanson – George.hanson417@gmail.com
2. Joseph Adams - jkojoadams@gmail.com
3. Kepgang Daveson Innocento Brank - davesonbrank@gmail.com
4. Andy Asante - pkandy001@gmail.com
5. Emmanuel Israel Nsedu - emmanuel.israelpgs@stu.cu.edu.ng
6. Hem Bondarwad – hembondarwad@gmail.com
7. Kisaakye Maureen -  maureenkisaakye6@gmail.com
8. Lewis Tem Bueh -  lewistem8@gmail.com
9. Luke Zondagh -  lukeshandzondagh@gmail.com
10. Soham Amod Shirolkar -  sohamshirolkar@usf.edu
11. Olaitan I. Awe - laitanawe@gmail.com


