#!/bin/bash

# Set variables for directories and files
input_dir="/home/ylee/AllmotifDB/AllmotifDB_meme_combined"
sequence_dir="/home/ylee/meme/Actg2_sequence"                     ### Change Here
sequence_name="Actg2_random"                                      ### Change Here : Actg2_hotspot, Actg2_ctrl, Actg2_random
mkdir -p "fimo_out/$sequence_name"

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
        fimo_output=$(fimo --o "$output_dir" "$input_dir/${protein}_combined.meme" "$fasta_file" 2>&1)  
   
        echo "FIMO analysis completed for $fasta_name $protein"
    done
done