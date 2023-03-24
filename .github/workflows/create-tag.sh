#!/bin/bash

latest_version=$1
echo "Version: $latest_version"

changelogDir="$(git rev-parse --show-toplevel)/CHANGELOG.md"
#echo "changelogDir: $changelogDir"

# Get the latest changelog entry from the CHANGELOG.md file
latest_entry=$(awk '/## \['"$latest_version"'\]/{flag=1;next}/## \[/{exit}flag' "$changelogDir" | sed -e '/##/d' | sed -e 's/^## //' -e '/^[[:space:]]*$/d' | sed 's/\n/\\n/g')
#echo "Entry: $latest_entry"

# grep the line that starts with ## followed by a space and the date
#tag_date=$(grep -m 1 "^## \[\d.\d.\d\]" "$changelogDir" | awk '{print $4}')
#echo "Tag date: $tag_date"

NEWLINE=$'\n'
tagMessage="$NEWLINE$latest_entry"
echo "Tag message: $tagMessage"

# grep the line that starts with ## followed by a space and the version number
#version=$(grep -m 1 "^## \[\d.\d.\d\]" "$changelogDir" | awk '{print $2}')
#echo "Tag version: $version"

# Create the new tag
#git tag -a "$latest_version" -m "$tagMessage"

# Push the new tag to the remote repository
#git push origin "$latest_version"
