#!/bin/bash

# Set variables for directories and files
input_dir="/home/ylee/mCross/eCLIP_meme_cell_combined"
sequence_dir="/home/ylee/meme/FERMT1_TPM2_sequence"                          ### Change Here
sequence_name="FERMT1"                                                       ### Change Here : FERMT1, TPM2

# Generate unique protein lists
proteins=$(ls "$input_dir" | sed -E 's/_.*//' | sort | uniq)

# Loop through all FASTA files in the sequence directory
for fasta_file in "$sequence_dir/$sequence_name"_*.fasta; do

    # Create the parent directory for the FIMO output
    fasta_name=$(basename "$fasta_file" .fasta)
    mkdir -p "fimo_out/$sequence_name/$fasta_name"
    echo "Processing FASTA file: $fasta_file"
    
    for protein in $proteins; do
        # Run fimo
        output_dir="fimo_out/$sequence_name/$fasta_name/$protein"
        fimo_output=$(fimo --o "$output_dir" "$input_dir/${protein}_combined_mCross.meme" "$fasta_file" 2>&1)   ##

        echo "FIMO analysis completed for $fasta_name $protein"
    done
done
