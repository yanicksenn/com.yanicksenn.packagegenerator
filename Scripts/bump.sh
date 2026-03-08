#!/usr/bin/env bash
set -euo pipefail

# Change to the root of the package
cd "$(dirname "$0")/.."

# Check dependencies
command -v git >/dev/null 2>&1 || { echo >&2 "Error: git is required but it's not installed. Aborting."; exit 1; }
command -v jq >/dev/null 2>&1 || { echo >&2 "Error: jq is required to parse package.json but it's not installed. Aborting."; exit 1; }

if [ $# -eq 0 ]; then
    echo "Usage: $0 <major|minor|patch|version>"
    exit 1
fi

BUMP_TYPE=$1
MANIFEST="package.json"

if [ ! -f "$MANIFEST" ]; then
    echo "Error: $MANIFEST not found in $(pwd)."
    exit 1
fi

CURRENT_VERSION=$(jq -r '.version' "$MANIFEST")
if [ -z "$CURRENT_VERSION" ] || [ "$CURRENT_VERSION" == "null" ]; then
    echo "Error: Could not read version from $MANIFEST."
    exit 1
fi

# Function to bump version
bump_version() {
    local version=$1
    local type=$2
    local IFS=.
    local -a a=($version)
    
    case $type in
        major)
            ((a[0]++))
            a[1]=0
            a[2]=0
            ;;
        minor)
            ((a[1]++))
            a[2]=0
            ;;
        patch)
            ((a[2]++))
            ;;
        *)
            # Allow passing explicit version
            echo "$type"
            return
            ;;
    esac
    echo "${a[0]}.${a[1]}.${a[2]}"
}

NEW_VERSION=$(bump_version "$CURRENT_VERSION" "$BUMP_TYPE")

if [ -z "$NEW_VERSION" ]; then
    echo "Error: Could not determine new version."
    exit 1
fi

echo "Bumping version from $CURRENT_VERSION to $NEW_VERSION"

# Update package.json
TMP_FILE=$(mktemp)
jq --indent 2 --arg v "$NEW_VERSION" '.version = $v' "$MANIFEST" > "$TMP_FILE" && mv "$TMP_FILE" "$MANIFEST"

# Create a commit
git add "$MANIFEST"
git commit -m "chore: bump version to $NEW_VERSION"

echo "Successfully bumped version to $NEW_VERSION and committed changes."
