## Antiviral Dengue Drugs Dataset Acquisition

<p align="justify">
This repository contains reproducibility steps for Dengue Virus Inhibitors prediction from natural compounds.
  
The pipeline processes input biosample data to extract biosample IDs, retrieve corresponding SRA accessions, download SRA data, and perform quality control using Fastp.The downloaded data is followed by running the notebooks in this oeder; 1) preprocessing_01.ipynb2) dimentionality_reduction_2_updated.ipynb 3) Hyperparameter_Tuning_machine_learning_3.ipynb and 4) processing_test_dataset_4.ipynb
</p>

```
python descriptorCalculator.py
```

## Data Wrangling and Preprocessing


scripts/descriptorCalculator.py
scripts/molecular_docking.sh
scripts/rank_binding_affinity.py
scripts/split_sdf.py
scripts/toSMI.py
notebooks/EDA_1_Wrangling.ipynb
notebooks/EDA_2_Visualization.ipynb
notebooks/ML_Dengue.ipynb
output/Models
output/Models/LR_model.pkl



## Reproducibility check

## Model Assessment and Validation

## Compounds Prediction

## Envelop protein determination of Ligand binding site

```
python rank_vina
```

## Virtual Screening and Mechanism of Binding Characterization

## ADMET Screening of Selected Compounds

After using OSIRIS DataWarrior, the hits with potential pharmacokinetic and toxicity moieties will be removed.


## Calculations of Ligand-Receptor Complexes using MMPBSA

The binding free energies of the protein-ligand complexes and the individual energy contributions of the residues were calculated using the Molecular Mechanics Poisson-Boltzmann Surface Area (MMPBSA) (Kumari et al., 2014). This is a corroboration method of validating the limitation of the current scoring function (Wang et al., 2018). R programming package was used to plot the graphs from the MMPBSA computations.

> [!NOTE]
> Useful information that users should know, even when skimming content.

> [!TIP]
> Helpful advice for doing things better or more easily.

> [!IMPORTANT]
> Key information users need to know to achieve their goal.

> [!WARNING]
> Urgent info that needs immediate user attention to avoid problems.

> [!CAUTION]
> Advises about risks or negative outcomes of certain actions.



----------

Here is a summary of the data flow chart throughout this research:

```mermaid
graph TD;
    A[Bioactive Dataset - 343,305 compounds]--Data preprocessing (Compound standardization)-->B[21,250 Study data: 4470 actives + 16780 inactive];
    B[21,250 Study data: 4470 actives + 16780 inactives]--Data splitting (1:4)-->C[14,875 training data + 3,187 test + 3,188 externally held];
    C[14,875 training data + 3,187 test + 3,188 externally held]--Evaluation data-->D[3,188 externally held];
    D[3,188 externally held]--Model validation-->E{ML Model pool};
    E{ML Model pool}--Model selection-->F{QSAR models};
    G[PaDEL descriptors: 1,444]--Variance filter (Threshold = 0.1)-->H[Approved descriptors: 684];
    H[Approved descriptors: 684]--QSAR modeling-->F{QSAR models};
    I[18 Known inhibitors‡]--※Further model validation-->F{QSAR models};
    F{QSAR models}-->J{Logistic Regression};
    F{QSAR models}--※LR output-->K[11 Inhibitors marked **Active**‡];
    L[2683 New compounds: 812 ZINC & 1871 EANPDB]--LR model prediction-->J{Logistic Regression};
    J{Logistic Regression}--Yes-->M[933 active compounds];
    J{Logistic Regression}--No-->N[1750 inactive compounds];
    M[933 active compounds]--Compound selection based on 2FOM structure-->O[853 selected compounds];
    O[853 selected compounds]--NS2B_NS3 Molecular Docking (Affinity ≤ -8.0 kcal)-->P[59 ligands + 2 Known inhibitors];
    P[59 ligands + 2 Known inhibitors]--Binding affinities postdocking-->Q[39 Top docked hits];
    Q[39 Top docked hits]---->R{ADMET Screening};
    R{ADMET Screening}--Veber's rules & Lipinski's RO5-->S[20 Top non-violating hits];
    S[20 Top non-violating hits]-->T[Top Protein-Ligand complexes];
    T[Top Protein-Ligand complexes]-->U{Molecular Dynamics Simulations};
    T[Top Protein-Ligand complexes]-->V{MMPBSA Computations};
    U{Molecular Dynamics Simulations}--RMSD-->W[2',4'-dihydroxychalcone/ZINC14441502/ZINC95485940 > ZINC38628344];
    U{Molecular Dynamics Simulations}--Rg-->X[ZINC38628344/ZINC14441502/ZINC95485940 > 2',4'-dihydroxychalcone];
    U{Molecular Dynamics Simulations}--RMSF-->Y[ZINC38628344 \ ZINC95485940 \ 2',4'-dihydroxychalcone \ ZINC14441502];
    V{MMPBSA Computations}--Contributing energy Terms-->Z[2',4'-dihydroxychalcone > ZINC38628344 > ZINC14441502 > ZINC95485940];
    V{MMPBSA Computations}--Per-residue Decomposition-->AA[ZINC38628344 > ZINC14441502 > ZINC95485940 > 2',4'-dihydroxychalcone];
```
