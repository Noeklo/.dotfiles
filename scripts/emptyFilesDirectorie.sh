
#!/bin/bash

# Find all directories named "files"
find . -type d -name "files" | while read -r dir; do
    # Move all files in the "files" directory up one level
    echo "Processing directory: $dir"
    parent_dir=$(dirname "$dir")
    mv "$dir"/* "$parent_dir"/

    # Remove the "files" directory if it is empty
    rmdir "$dir" 2>/dev/null && echo "Removed empty directory: $dir"
done

echo "File moving and cleanup complete."
