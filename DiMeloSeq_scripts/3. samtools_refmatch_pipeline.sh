samtools sort -@24 aligned.bam > sorted.bam;
samtools view -F 2308 -b -@24 sorted.bam > clean.bam;
samtools index -@24 clean.bam;
python3 ~/scripts/refModMatch.py clean.bam refmatch.bam;
samtools index -@24 refmatch.bam
