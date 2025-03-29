#!/bin/bash

#input filename at the end of the command

ls *gz | cut -d . -f 1 | sort | uniq | while read id; do

fastqc -f fastq -t 7 -o /path/to/fastq/files ${id}.fastq.gz

done
