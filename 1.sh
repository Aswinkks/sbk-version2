# Create a temporary file to store the output of git diff
temp_file=$(mktemp)
git diff --name-only HEAD^ HEAD > "$temp_file"

# Initialize an empty file_list array
file_list=()

# Populate the file_list array by reading from the temporary file
while IFS= read -r file; do
  file_list+=("$file")
done < "$temp_file"

# Clean up the temporary file
rm "$temp_file"

# Print the contents of the file_list
for file in "${file_list[@]}"; do
  echo "File1: $file"
done

