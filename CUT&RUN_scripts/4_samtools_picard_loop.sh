#!/bin/bash
#Convert sam to bam, sort and remove duplicates with picard, and index 
ls *.sam | cut -d . -f 1 | sort | uniq \
    | while read id; do \

       samtools view -@7 -S -b ${id}.sam > ${id}.bam
	   samtools sort -@7 ${id}.bam -o /path/to/sorted/bam/files/${id}_sorted.bam

	   picard MarkDuplicates \
      REMOVE_DUPLICATES= true \
      I= /path/to/sorted/bam/files/${id}_sorted.bam \
      O= /path/to/sorted/bam/files/sorted_rmvdup/${id}_sorted_rmvdups.bam \
      M= /path/to/sorted/bam/files/sorted_rmvdup/${id}_sorted_rmvdups.log \

	  samtools index /path/to/sorted/bam/files/sorted_rmvdup/${id}_sorted_rmvdups.bam


      done

#index to keepdup file
ls *.bam | cut -d _ -f 1 | sort | uniq \
    | while read id; do \
	  samtools index /path/to/sorted/bam/files/${id}_sorted.bam
      done
