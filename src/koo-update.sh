#!/bin/bash
#
# Regenerate Formula/koo.rb from templates/koo-template.txt by substituting the
# {PLACEHOLDER} tokens with values passed in via environment variables.
#
# Invoked from koo-cli's GitLab CI (publish:homebrew) at release time, which clones
# this tap, exports the variables below, runs this script, then commits & pushes the
# updated Formula/koo.rb. See koo-cli's .gitlab-ci.yml and RELEASING.md.

# Exit script on error
set -e

# File Paths
script_dir=$(dirname "$(realpath "$0")")
template_file_path="$script_dir/../templates/koo-template.txt"
koo_formula_file_path="$script_dir/../Formula/koo.rb"

# List of environment variables to check
env_vars=("URL" "VERIFIED" "VERSION" "SHA_X86_64" "SHA_AARCH64")

# Check each environment variable is set
for env_var in "${env_vars[@]}"; do
    if [[ -z "${!env_var}" ]]; then
        echo "$env_var environment variable is not set"
        exit 1
    fi
done

# Define the keys and values arrays
keys=()
values=()

# Populate the keys and values arrays based on env_vars
for env_var in "${env_vars[@]}"; do
    keys+=("{$env_var}")
    values+=("${!env_var}")
done

# Read the content of the template file
template_file_content=$(<"$template_file_path")

# Iterate over the arrays and replace occurrences in the file content
for index in "${!keys[@]}"; do
    key="${keys[index]}"
    value="${values[index]}"

    # Using sed here as it can handle complex replacement patterns more reliably
    template_file_content=$(echo "$template_file_content" | sed "s#$key#$value#g")
done

# Write the modified content to the Formula koo file
echo "$template_file_content" > "$koo_formula_file_path"
