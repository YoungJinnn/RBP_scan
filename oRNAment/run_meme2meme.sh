#!/bin/bash

# Define the input and output directories
input_dir="/home/ylee/oRNAment/oRNAment_meme"
output_dir="/home/ylee/oRNAment/oRNAment_meme_combined"
mkdir -p "$output_dir"  # Create output directory if it doesn't exist

# Generate unique protein lists
proteins=$(ls "$input_dir" | sed -E 's/_PWM_.*//g' | sort | uniq)


# Process files for each proteins
for protein in $proteins; do
    # Define the output file for the combined MEME file
    output_file="$output_dir/${protein}_combined_oRNAment.meme"       ##
    
    # Find all files matching and protein prefix and merge them
    meme2meme $(ls "$input_dir/${protein}_PWM_"*.meme) > "$output_file"

    echo "Combined files for $protein -> $output_file"
done

