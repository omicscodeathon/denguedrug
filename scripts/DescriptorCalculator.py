import subprocess
from tkinter import filedialog as fd

def run_padel(input_file, output_file, padel_jar_path):
    command = [
        'java', '-jar', padel_jar_path,
        '-dir', input_file,  # Directory of input SMILES file
        '-file', output_file,  # Output CSV file
        '-2d'  # 2D descriptors
    ]

    try:
        subprocess.run(command, check=True)
        print("PaDEL-Descriptor calculation completed successfully.")
    except subprocess.CalledProcessError as e:
        print("Error during PaDEL-Descriptor calculation:", e)

# Define the paths to your files and the PaDEL-Descriptor jar file
input_file = 'Actives.smi'
output_file = 'Actives.csv'
padel_jar_path = fd.askopenfilename(title='Select Padel file') # Change this to the path where your PaDEL-Descriptor jar file is located

# Run PaDEL-Descriptor
run_padel(input_file, output_file, padel_jar_path)