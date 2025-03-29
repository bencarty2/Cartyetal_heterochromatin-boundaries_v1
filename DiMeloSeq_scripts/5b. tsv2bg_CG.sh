#!/bin/bash

# Directory containing the .tsv files
input_dir="/path/to/CG/tsvs/files"

# Loop through every .tsv file in the directory
for file in "$input_dir"/*CG.tsv; do
  # Check if the file exists
  if [[ -f "$file" ]]; then
    echo "Processing $file"

    # Define output file prefix by stripping the .tsv extension
    output_prefix="${file%.tsv}"

    # Run each command in the background for parallel processing
    grep 'm' "$file" | cut -f1,2,3,5 | \
      sort --parallel=4 -S 4G -k1,1 -k2,2n > "${output_prefix}_coverage.bg" &

    grep 'm' "$file" | cut -f1,2,3,11 | \
      sort --parallel=4 -S 4G -k1,1 -k2,2n > "${output_prefix}_modfraction.bg" &

    grep 'm' "$file" | cut -f1,2,3,12 | \
      sort --parallel=4 -S 4G -k1,1 -k2,2n > "${output_prefix}_modcount.bg" &

    # Wait for all background processes for this file to finish
    wait
  else
    echo "No .tsv files found in $input_dir"
  fi
done

# Final wait to ensure no background jobs remain
wait
