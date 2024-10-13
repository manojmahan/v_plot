#!/bin/bash

BED_FILE="data/mapped.bed.gz"

# read the bed file and used the linear transformation in order to rescale the mid-value in (-500,500)
# and convert the transformed value to integer
zcat "$BED_FILE" | awk '{
    # Perform the transformation
    transformed_value3 = (1000 / ($4 -$3)) * (($9+$10)/2 -$3) - 500;
    print transformed_value3,$12;
}'| awk '{print ($1 < 0) ? int($1) - 1 : int($1), $2} ' | tr ' ' '\t' > new_output.tsv
       

# python script to calculate the frequency and plot the vplot using matplotlib

python3 main.py new_output.tsv
