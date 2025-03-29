#!/bin/bash

#rmvdup
ls *rmvdups.bam | cut -d _ -f 1 | sort | uniq \
    | while read id; do \

      bamCoverage --bam ${id}_sorted_rmvdups.bam -o /path/to/bamcoverage/output/${id}_rmvdups_H3K9me3.bw \
    --scaleFactor 1 \
    --binSize 25 \
    --normalizeUsing CPM \
    --effectiveGenomeSize 6058287847 \
    --ignoreForNormalization chrX \
    --extendReads \
    --numberOfProcessors=max \

      done

