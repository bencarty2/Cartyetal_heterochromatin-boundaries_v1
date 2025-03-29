#!/bin/bash

#general pipeline for multibigwig summary in deeptools covering Neo4p13 region. 
multiBigwigSummary bins \
  --bwfiles example.bw \
  --binSize 1000 \
  --region chr4_2:42650000:43150000 \
  --outFileName output.npz \
  --outRawCounts output.tsv
