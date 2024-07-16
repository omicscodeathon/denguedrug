![DenD](https://img.shields.io/badge/Project-DengueDrug-lightblue) 
[![Open In Collab](https://colab.research.google.com/assets/colab-badge.svg)](xxxxxx)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) 
![GitHub Repo stars](https://img.shields.io/github/stars/omicscodeathon/denguedrug)
[![Github all releases](https://img.shields.io/github/downloads/omicscodeathon/denguedrug/total.svg)](https://GitHub.com/omicscodeathon/denguedrug/releases/)
![Python](https://img.shields.io/badge/python-3.12-blue.svg)
[![GitHub contributors](https://img.shields.io/github/contributors/omicscodeathon/denguedrug.svg)](https://GitHub.com/omicscodeathon/denguedrug/graphs/contributors/)
[![Github tag](https://badgen.net/github/tag/omicscodeathon/denguedrug)](https://github.com/omicscodeathon/denguedrug/tags/)

# denguedrug
Deep Learning and Molecular Docking Prediction of Potential Inhibitors against Dengue Virus

## Overview 
In this project, we are building a _in silico_ pipeline to identify novel dengue virus inhibitors. We will incorporate Deep/Machine Learning (DL/ML) and molecular modelling techniques into the pipeline.

Dengue virus (DENV) is a Flaviviridae family member responsible for the most prevalent mosquito-borne viral hemorrhagic fever. The transmission of Dengue virus to humans primarily occurs through mosquito bites from species such as Aedes aegypti and Aedes albopictus, widespread in tropical and subtropical climates, including both urban and rural regions. The severe and sometimes fatal diseases known as dengue hemorrhagic fever (DHF) and dengue shock syndrome (DSS) can develop in certain people infected with DENV. The spread of dengue fever has resulted in several medical emergencies and deaths for which no drug is currently available. Despite its prevalence, the treatment administered is symptomatic. The structural information available for the DENV presented an opportunity to discover potent antiviral agents capable of disrupting the early stages of DENV infection. 
Our approach seeks to train different machine learning models using the Anti-Dengue dataset from PubChem to distinguish between potential anti-Dengue compounds and non-anti-Dengue compounds. Subsequently, we will further screen the predicted compounds against a Dengue protein target for downstream analysis. Details of the pipeline can be found in the workflow below.

Please [cite](xxx) and [star](https://docs.github.com/en/get-started/exploring-projects-on-github/saving-repositories-with-stars) the repository if you utilise the pipeline for research or commercial purposes

## Table of contents
1. [Objectives](#objectives)
2. [Description](#description)
3. [Manuscript](#manuscript)
4. [Results](#results)
5. [How to use](#how-to-use)
6. [Data availability](#data-availability)
7. [Credits](#credits)

## Objectives
- [ ] Identfiy dengue virus protein target.
- [ ] Identify dengue virus ligand database for DL/ML training and molecular modeling method validation.
- [ ] Determine DL/ML algorithm to be utilised in project.
- [ ] Process ligand database and train DL/ML model.
- [ ] Evaluate DL/ML performance.
- [ ] Validate molecular modeling method using prepared ligand database (Actives vs non-actives)

  **more to be added**

## Description
The figure illustrates the proposed DengueDrug pipeline to be utilized to identify Dengue Virus Inhibitors.

<p align="center">
  <img src="figures/DengueDrug%20project%20workflow%20diagram.png" alt="Proposed Dengue Drug Identification Pipeline" title="Proposed Dengue Drug Identification Pipeline" width="800"/>
  <br>
  <font size="1">
  Proposed Dengue Drug Identification Pipeline</a>
  </font>
</p>

**Step 1: Identification of Dengue Virus inhibitors database for ML training**

The ligand database was obtained from PubChem [(BioAssay ID: 651640)](https://pubchem.ncbi.nlm.nih.gov/bioassay/651640). The ligand database was experimentally generated using (_in vivo_) DENV2 CPE-Based HTS Measured in Cell-Based and Microorganism Combination System method by the [Broad Institute](http://www.broadinstitute.org/). A total of 347,136 compounds were analyzed for their Dengue Virus inhibition and 5,946 actives and 324,845 non-actives were identified. A active is represented as a compound that can exhibit an ATP activity level above 20% at 10 $\mu M$. 

**Step 2: Preprocessing**

 - The unprocessed database can be found [here](data/unprocessed_database_PubChem_651640).

 - The molecular descriptors of the actives and inactives were calculated using [PaDEL-Descriptors](http://www.yapcwsoft.com/dd/padeldescriptor/). The descriptors of the [actives and inactives](data) were calculated using the [DescriptorCalculator.py](scripts/DescriptorCalculator.py) script.

**Step 3: Model construction**

Brief explaination

**Step 4: Prediction**

Brief explaination

## Manuscript

**Abstract**

When using the pipeline in for research or commercial purposes please [cite](xxx) our research.

cite: doi_link

## Results

**to be conducted**

## How to use

The [documenation](docs) and [tutorial](notebooks) give a general overview of how the pipeline can be utilized for identifying novel Dengue Virus inhibitors.

**Tutorial 1**
DL/ML pipeline

**Turtorial 2**
Molecular docking and dynamics

## Data availability

The data utilized for the project can be found [here](data)

**Links to directories containing original and processed databases, DL/ML models and methods/scripts, molecular modeling methods/scripts,etc** 

## Credits

**list of contributors**


