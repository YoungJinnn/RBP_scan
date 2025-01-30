#!/bin/bash

# Set variables for directories and files
input_dir="/home/ylee/mCross/eCLIP_meme_cell_combined"
sequence_dir="/home/ylee/meme/Actg1_sequence"                             ### Change Here
sequence_name="Actg1_hotspot"                                             ### Change Here : Actg1_hotspot, Actg1_ctrl, Actg1_random
# output_count_file="sequence_counts.txt"  # File to store counts

# Generate unique protein lists
proteins=$(ls "$input_dir" | sed -E 's/_.*//' | sort | uniq)

# Initialize the output file (overwrite if exists)
# echo "" > "$output_count_file"

for protein in $proteins; do
   
    # Run fimo
    output_dir="fimo_out/$sequence_name/$protein"
    fasta_file="$sequence_dir/${sequence_name}.fasta"
    fimo_output=$(fimo --o "$output_dir" "$input_dir/${protein}_combined_mCross.meme" "$fasta_file" 2>&1)   ##
   
    # Extract the numbers of best sites found for each motif from the fimo output
    # motif_counts=$(echo "$fimo_output" | grep "Found a best site in" | awk '{print $6}')
    
    # Store the counts as an array
    # motif_sequence_counts=()
    # while IFS= read -r count; do
    #     motif_sequence_counts+=("$count")
    # done <<< "$motif_counts"

    # Write the result (protein_name and the motif counts) to the output file
    # echo "$protein ${motif_sequence_counts[@]}" >> "$output_count_file"
   
    echo "FIMO analysis completed for $fasta_name $protein"
done