#!/usr/bin/env bash
set -euo pipefail

# Change to the root of the package
cd "$(dirname "$0")/.."

# Check dependencies
command -v git >/dev/null 2>&1 || { echo >&2 "Error: git is required but it's not installed. Aborting."; exit 1; }
command -v jq >/dev/null 2>&1 || { echo >&2 "Error: jq is required to parse package.json but it's not installed. Aborting."; exit 1; }

MANIFEST="package.json"

if [ ! -f "$MANIFEST" ]; then
    echo "Error: $MANIFEST not found in $(pwd)."
    exit 1
fi

VERSION=$(jq -r '.version' "$MANIFEST")
if [ -z "$VERSION" ] || [ "$VERSION" == "null" ]; then
    echo "Error: Could not read version from $MANIFEST."
    exit 1
fi

# Ensure working directory is clean
if [ -n "$(git status --porcelain)" ]; then
    echo "Error: Working directory is not clean. Please commit or stash your changes before releasing."
    exit 1
fi

# Ensure we are on the main branch
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [ "$CURRENT_BRANCH" != "main" ] && [ "$CURRENT_BRANCH" != "master" ]; then
    echo "Warning: You are releasing from branch '$CURRENT_BRANCH' instead of main or master."
    echo "Press Ctrl+C to abort or wait 5 seconds to continue..."
    sleep 5
fi

TAG_NAME="v$VERSION"

# Check if tag already exists
if git rev-parse "$TAG_NAME" >/dev/null 2>&1; then
    echo "Error: Tag $TAG_NAME already exists. Aborting."
    exit 1
fi

echo "Creating release for version $VERSION ($TAG_NAME)..."

git tag -a "$TAG_NAME" -m "Release $TAG_NAME"

echo "Pushing commits and tags to origin..."
git push origin "$CURRENT_BRANCH"
git push origin "$TAG_NAME"

echo "Release $TAG_NAME created and pushed successfully."
