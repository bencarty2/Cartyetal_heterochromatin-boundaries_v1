for file in /path/to/bams/*.bam ; do
	modkit pileup -t 24 --include-bed /path/to/bedfile/regions --ref /path/to/fasta --motif A 0 --filter-threshold A:0.8 --mod-threshold a:0.98 $file ${file::-12}6mA.tsv
	modkit pileup -t 24 --include-bed /path/to/bedfile/regions --ref /path/to/fasta --cpg --filter-threshold C:0.8 --mod-threshold m:0.8 $file ${file::-12}CG.tsv
done
