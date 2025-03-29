General Pipeline for DiMelo-Seq processing in Carty et al 2025:

    1. Basecalling of pod5 raw read files with Dorado, with SUP 4.3, modified basecalling for 6mA and 5mCG/5hmCG
    2. Alignment of basecalled bam files with Dorado aligner
    3. Sorting, cleaning indexing with samtools, and run refmodmatch.py to remove ML tags unmatched to the genome.  
    4. Run Modkit to filter methylation probabilities for 6mA and 5mCG and generate tsv files with methylation summaries. 
    5. Convert tsv file generated in modkit to bedgraph file, extracting modified fraction, coverage and counts. 
    6. Convert bedgraph generated in step 5 above to a bigwig file using BedGraph2BigWig. 
    7. Generation of single molecule bed files using fibertools-rs (ft extract command).  

Performed in Genoa SLURM cluster at Dept of Biochemistry, University of Oxford

Ben Carty, PhD