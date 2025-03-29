#!/bin/bash

# Directory containing the .tsv files
dir="path/to/modkit/6mA_files"

# Loop over each .tsv file in the directory
for file in "$dir"/*.tsv
do
  echo "Processing $file"

  # Define the output prefix by stripping the .tsv extension
  output_prefix="${file%.tsv}"

  # First command: create coverage.bg
  awk -v OFS="\t" '$4=="a" { print $0 }' "$file" | cut -f1,2,3,5 | \
  sort --parallel=4 -S 4G -k1,1 -k2,2n > "${output_prefix}_coverage.bg" &

  # Second command: create mod_fraction.bg
  awk -v OFS="\t" '$4=="a" { print $0 }' "$file" | cut -f1,2,3,11 | \
  sort --parallel=4 -S 4G -k1,1 -k2,2n > "${output_prefix}_modfraction.bg" &

  # Third command: create mod_count.bg
  awk -v OFS="\t" '$4=="a" { print $0 }' "$file" | cut -f1,2,3,12 | \
  sort --parallel=4 -S 4G -k1,1 -k2,2n > "${output_prefix}_modcount.bg" &

  # Wait for all background jobs of the current file to finish
  wait
done

# Final wait for any remaining background jobs
wait
