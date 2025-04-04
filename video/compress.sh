#!/bin/bash

# compress.sh - Compresses videos using ffmpeg
# Usage: ./compress.sh <glob_pattern>
# Example: ./compress.sh "*.mp4" or ./compress.sh "input/*.mov"

set -e

if [ $# -eq 0 ]; then
    echo "Error: No input files specified"
    echo "Usage: $0 <glob_pattern>"
    echo "Example: $0 \"*.mp4\" or $0 \"input/*.mov\""
    exit 1
fi

# Create output directory if it doesn't exist
mkdir -p compressed

# Process each file matching the pattern
for file in $1; do
    # Skip if not a file
    if [ ! -f "$file" ]; then
        echo "Skipping $file (not a regular file)"
        continue
    fi
    
    # Get the filename without the path
    filename=$(basename "$file")
    extension="${filename##*.}"
    basename="${filename%.*}"
    
    echo "Compressing $file..."
    ffmpeg -i "$file" -vcodec libx264 -crf 28 "compressed/${basename}_compressed.${extension}" -hide_banner -loglevel error
    
    # Display compression results
    original_size=$(du -h "$file" | cut -f1)
    compressed_size=$(du -h "compressed/${basename}_compressed.${extension}" | cut -f1)
    
    echo "✅ Compressed $filename"
    echo "   Original: $original_size → Compressed: $compressed_size"
    echo ""
done

echo "All files compressed successfully!"
echo "Compressed files are available in the 'compressed' directory" 