#!/bin/bash

latest_version=$1
echo "Version: $latest_version"

changelogDir="$(git rev-parse --show-toplevel)/CHANGELOG.md"
echo "changelogDir: $changelogDir"

# Get the latest changelog entry from the CHANGELOG.md file
latest_entry=$(awk '/## \['"$latest_version"'\]/{flag=1;next}/## \[/{exit}flag' "$changelogDir" | sed -e '/##/d' | sed -e 's/^## //' -e '/^[[:space:]]*$/d' | sed 's/\n/\\n/g')
echo "Entry: $latest_entry"

NEWLINE=$'\n'
tagMessage=$NEWLINE$latest_entry
echo "tagMessage: $tagMessage"

# Create the new tag
#git tag -a "$latest_version" -m "$tagMessage"

# Push the new tag to the remote repository
#git push origin "$latest_version"
