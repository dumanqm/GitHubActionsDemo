#!/bin/bash

# Get the latest changelog entry from the CHANGELOG.md file
latest_entry=$(sed -n '/## \[.*\] -/,$p' CHANGELOG.md | head -n 4)

# Extract the version number from the latest entry
version=$(echo "$latest_entry" | grep -oP '(?<=## \[)[^]]+(?=\] -)')

# Create the new tag
git tag -a "$version" -m "Version $version"

# Push the new tag to the remote repository
git push origin "$version"
