# RBP_scan
RNA binding proteins(RBPs) motif scanning pipeline

<br>

## Database collection
### mCross
1. unzip files
   - unzip eCLIP_mCross_PWM.tgz file
   - rename the unzipped folder into eCLIP_PWM

3. create folder
   - eCLIP_PFM_processed
   - eCLIP_meme
   - eCLIP_meme_combined
   - eCLIP_meme_cell_combined

4. run R and shell file
   - run mCross_extract_meme.ipynb
   - run run_matrix2meme.sh
   - run run_meme2meme_1.sh
   - run run_meme2meme_2.sh


### CisBP-RNA
1. unzip files
   - unzip Homo_sapiens_2024_12_30_7_19_am.zip, rename the unzipped folder into Homo_sapiens
   - unzip Mus_musculus_2024_12_30_8_15_am.zip, rename the unzipped folder into Mus_musculus

3. create folder
   - CisBP-RNA_PFM_processed
   - CisBP-RNA_PFM_processed_species_combined
   - CisBP-RNA_meme
   - CisBP-RNA_meme_combined
  
4. run R and shell file
   - run CisBP-RNA_extract_meme.ipynb
   - run run_matrix2meme.sh
   - run run_meme2meme.sh


### oRNAment
1. unzip files
   - unzip PWMS.tgz

3. create folder
   - oRNAment_PFM_species_filtered
   - oRNAment_meme
   - oRNAment_meme_combined
  
4. run R and shell file
   - run oRNAment_extract_meme.ipynb
   - run run_matrix2meme.sh
   - run run_meme2meme.sh


### RBPDB
1. unzip files
   - unzip PFMDir.zip, rename the unzipped folder into PFMs

3. create folder
   - RBPDB_PFM_species_filtered
   - RBPDB_meme
   - RBPDB_meme_combined
  
4. run R and shell file
   - RBPDB_extract_meme.ipynb
   - run run_matrix2meme.sh
   - run run_meme2meme.sh


### Combine AllmotifDB
1. run shell file
   - run move_meme_results.sh
   - run run_meme2meme.sh
  
<br>

## RBP scanning
### install meme package
1. make meme directory and download the most recent version of meme (meme-5.5.7.tar.gz used) <br>
   https://meme-suite.org/meme/doc/download.html
2. follow the installation guide to install (Quick Install from Source used) <br>
   https://meme-suite.org/meme/doc/install.html?man_type=web
   
### run fimo
1. unzip files
   - Actg1_sequence.tar.gz
   - Actg2_sequence.tar.gz
   - FERMT1_TPM2_sequence.tar.gz
  
2. make fimo_out directory

3. run shell file
   - run_fimo_Actg1.sh
   - run_fimo_Actg2_mapped.sh
   - run_fimo_FERMT1_TPM2_mapped.sh

4. export the csv results into csv
   - run Fimo_result_save_csv.ipynb
