#!/bin/bash
#change folder and subfolder permissions if needed
chmod 777 -R xxx.dir

# list all files' names containing R1 (so also R2)-> separate by "_"-> extract first field (id) after separation-> sort and rmv redudant fields-> while loop to concatenate fastq.gz per id 
ls *R1_* | cut -d _ -f 1 | sort | uniq \
    | while read id; do \
        cat ${id}_*R1*.fastq.gz > ${id}_r1.fastq.gz;
        cat ${id}_*R2*.fastq.gz > ${id}_r2.fastq.gz;
      done
