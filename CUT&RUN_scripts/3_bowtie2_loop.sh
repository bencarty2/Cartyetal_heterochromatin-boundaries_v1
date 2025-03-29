#    !/bin/bash

	ls *r1* | cut -d _ -f 1 | sort | uniq \
    | while read id; do \

        bowtie2 -p 9 --local --very-sensitive-local --no-unal --no-mixed --no-discordant --minins 10 --maxins 700 --trim3 0 --trim5 5 -x RPE1 -1 ${id}_r1.fastq.gz -2 ${id}_r2.fastq.gz -S /path/to/Desktop/output/${id}.sam 2>/path/to/Desktop/output/${id}_bowtie.log

      done
