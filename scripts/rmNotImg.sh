
#!/bin/bash

# Array of allowed image file extensions (in lowercase)
image_extensions=("jpg" "jpeg" "png" "gif" "bmp" "tiff" "webp")

# Convert the array into a pipe-separated string for use in grep
image_extensions_pattern=$(printf "|%s" "${image_extensions[@]}")
image_extensions_pattern="${image_extensions_pattern:1}"

# Delete non-image files
find . -type f | while read -r file; do
    if ! echo "${file,,}" | grep -qE "\.(${image_extensions_pattern})$"; then
        echo "Deleting file: $file"
        rm "$file"
    fi
done

# Delete empty directories
find . -type d | while read -r dir; do
    if [ -z "$(find "$dir" -type f | grep -E "\.(${image_extensions_pattern})$")" ]; then
        echo "Deleting directory: $dir"
        rm -rf "$dir"
    fi
done

echo "Deletion of non-image files and empty directories complete."
