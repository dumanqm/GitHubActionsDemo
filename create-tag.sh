#!/bin/bash

# Get the latest changelog entry from the CHANGELOG.md file
latest_entry=$(sed -n '/## \[.*\] -/,$p' CHANGELOG.md | sed '1,/^$/d')

# Extract the version number from the latest entry
version=$(echo "$latest_entry" | sed -n 's/^## \[\(.*\)\].*/\1/p' | head -n 1)

# Create the new tag
git tag -a "$version" -m "Version $version"

# Push the new tag to the remote repository
git push origin "$version"
