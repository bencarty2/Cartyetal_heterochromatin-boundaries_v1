#!/bin/bash

# Define the folder containing your .bg files
bg_folder="path/to/bg/files"
# Define the chromosome sizes file for BigWig conversion
chrom_sizes="$HOME/references/RPE1_genome/rpe1.size"

# Loop through each BedGraph (.bg) file in the folder using find
find "$bg_folder" -name "*.bg" | while IFS= read -r bg_file; do
    # Define the output file name
    output_bw="${bg_file%.bg}.bw"
    
    echo "Processing $bg_file..."

    # Convert the BedGraph to BigWig
    bedGraphToBigWig "$bg_file" "$chrom_sizes" "$output_bw"

    echo "Converted and saved as $output_bw"
done

echo "All files processed."
