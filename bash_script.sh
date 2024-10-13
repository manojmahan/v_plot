#!/bin/bash

BED_FILE="data/mapped.bed.gz"

zcat "$BED_FILE" | awk '{
    # Perform the transformation
    transformed_value3 = (1000 / ($4 -$3)) * (($9+$10)/2 -$3) - 500;
    print transformed_value3,$12;
}'| awk '{print ($1 < 0) ? int($1) - 1 : int($1), $2} ' | tr ' ' '\t' > new_output.tsv
       
#sort |uniq -c | awk '{print $1, $2, $3}' | tr ' ' '\t' > output.tsv


python3 main.py new_output.tsv
