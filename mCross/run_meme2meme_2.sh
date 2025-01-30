#!/bin/bash

# Define the input and output directories
input_dir="/home/ylee/mCross/eCLIP_meme_combined"
output_dir="/home/ylee/mCross/eCLIP_meme_cell_combined"
mkdir -p "$output_dir"  # Create output directory if it doesn't exist

# Generate unique protein lists
proteins=$(ls "$input_dir" | sed -E 's/^[^_]+_([^_]+)_.*$/\1/' | sort | uniq)


# Process files for each proteins
for protein in $proteins; do
    # Define the output file for the combined MEME file
    output_file="$output_dir/${protein}_combined_mCross.meme"     ##
    
    # Find all files matching the protein prefix and merge them
    meme2meme $(ls "$input_dir"/*"${protein}"_combined.meme) > "$output_file"
    
    echo "Combined files for $protein -> $output_file"  
done