General Pipeline for CUT&RUN analyses in Carty et al 2025:

    1. Concatenation of fastq files from separate Illumina NextSeq 500 sequencing lanes into a single file
    2. Quality control: FASTQC analysis
    3. Mapping: Bowtie2 to RPE1 reference genome [with trimming, local mapping and filtering out discordant/mixed/unaliged reads]
    4. Conversion of sam -> bam sorted + Removal duplicates: Samtools conversion to bam, sorting and indexing. Picard removal of duplicates
    5. Conversion Bam -> Bigwig + Normalization (CPM): Deeptools bamCoverage scaling, counting and normalizing [currently CPM normalization, with read extension]
    6. Read counting: Deeptools multiBigwigSummary on bigwigfiles [with a given reference genomic region BED file i.e. 500kb Neo4p13 region]

Done in local conda environments in MacOS ARM (M1 Max).

Ben Carty, PhD