#!/bin/bash

# Define the input and output directories
input_dir="/home/ylee/mCross/eCLIP_meme"
output_dir="/home/ylee/mCross/eCLIP_meme_combined"
mkdir -p "$output_dir"  # Create output directory if it doesn't exist

# Generate unique protein lists for HepG2 and K562
hepG2_proteins=$(ls "$input_dir" | grep "^HepG2" | sed -E 's/HepG2\.([^.]+)\..*/\1/' | sort | uniq)
k562_proteins=$(ls "$input_dir" | grep "^K562" | sed -E 's/K562\.([^.]+)\..*/\1/' | sort | uniq)

# Process HepG2 files
for protein in $hepG2_proteins; do
    # Define a combined output file for HepG2 proteins
    output_file="$output_dir/HepG2_${protein}_combined.meme"
    
    # Find all files matching the HepG2 and protein prefix and merge them
    meme2meme $(ls "$input_dir"/HepG2.$protein.*.meme) > "$output_file"
    
    echo "Combined files for HepG2 - $protein -> $output_file"
done

# Process K562 files
for protein in $k562_proteins; do
    # Define a combined output file for K562 proteins
    output_file="$output_dir/K562_${protein}_combined.meme"
    
    # Find all files matching the K562 and protein prefix and merge them
    meme2meme $(ls "$input_dir"/K562.$protein.*.meme) > "$output_file"
    
    echo "Combined files for K562 - $protein -> $output_file"
done