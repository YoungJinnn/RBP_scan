#!/bin/bash

# Define the input and output directories
input_dir="/home/ylee/oRNAment/oRNAment_PFM_species_filtered/"
output_dir="/home/ylee/oRNAment/oRNAment_meme/"
mkdir -p "$output_dir"  # Create output directory if it doesn't exist

# Loop over each txt file in the input directory
for matrix_file in "$input_dir"/*.txt; do
    # Extract the filename without extension
    filename=$(basename "$matrix_file" .txt)
    
    # Define the output filename
    output_file="$output_dir/$filename.meme"
    
    # Run matrix2meme and redirect output to the .meme file
    cat "$matrix_file" | matrix2meme -dna > "$output_file"
    
    echo "Processed $matrix_file -> $output_file"
done
