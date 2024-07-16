import os
from rdkit import Chem
from tkinter import filedialog as fd

def sdf_to_smiles(sdf_file, output_smiles_file):
    suppl = Chem.SDMolSupplier(sdf_file)
    with open(output_smiles_file, 'w') as f:
        for mol in suppl:
            if mol is not None:
                smiles = Chem.MolToSmiles(mol)
                f.write(smiles + '\n')
                
dir = fd.askdirectory()
files = os.listdir(dir)
os.chdir(dir)
for file in files:
    smiNum=(file.split('_')[1]).split('.')[0]
    outputfile = f'Cmpds{smiNum}.smi'
    sdf_to_smiles(file, outputfile)
    print('Completed for Compound ',smiNum)
    
