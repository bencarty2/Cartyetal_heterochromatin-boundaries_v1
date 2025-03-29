for file in path/to/bam/files/*refmatch.bam ; do
    ft extract --m6a /path/to/output/directory/$(basename "${file}" refmatch.bam)m6a_0.8.bed --ml 204 -r -t 24 "${file}"
    ft extract --cpg /path/to/output/directory/$(basename "${file}" refmatch.bam)CG.bed --ml 204 -r -t 24 "${file}"
done
