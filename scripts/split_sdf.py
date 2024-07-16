# This script splits a large SDF file into smaller files with a specified number of molecules each

import os
from tkinter import filedialog as fd

def split_sdf(input_file, num_molecules_per_file, output_prefix="split_"):
    """
    Splits an SDF file into smaller files with a specified number of molecules each.

    Args:
        input_file (str): Path to the input SDF file.
        num_molecules_per_file (int): Number of molecules to write to each output file.
        output_prefix (str, optional): Prefix for the output filenames. Defaults to "split_".
    """

    with open(input_file, 'r') as f_in:
        data = f_in.read().split('$$$$')

    chunks = [data[i:i + num_molecules_per_file] for i in range(0, len(data), num_molecules_per_file)]

    for i, chunk in enumerate(chunks):
        with open(f"{output_prefix}{i + 1}.sdf", 'w') as f_out:
            f_out.write('$$$$'.join(chunk))

# Specify your file paths and number of molecules per file


num_molecules_per_file = 10000

input_file = fd.askopenfilename(title='Select sdf file to split')
split_sdf(input_file, num_molecules_per_file)
print("Splitting completed. SDF files created.")