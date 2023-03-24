#!/bin/bash

latest_version=$1
echo "Version: $latest_version"

NEWLINE=$'\n'

# Get the latest changelog entry from the CHANGELOG.md file
latest_entry=$(awk '/## \['"$latest_version"'\]/{flag=1;next}/## \[/{exit}flag' CHANGELOG.md | sed -e '/##/d' | sed -e 's/^## //' -e '/^[[:space:]]*$/d' | sed 's/\n/\\n/g')
echo "Entry: $latest_entry"

tagMessage=$NEWLINE$latest_entry
echo "tagMessage: $tagMessage"

# Create the new tag
git tag -a "$latest_version" -m "$tagMessage"

# Push the new tag to the remote repository
git push origin "$latest_version"
