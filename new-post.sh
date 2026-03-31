#!/bin/bash

# Interactive Hugo post creator
# Creates posts with language and format selection

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== New Blog Post ===${NC}"
echo

# Get post title/slug
read -p "Post slug (e.g., my-awesome-post): " slug

if [ -z "$slug" ]; then
    echo -e "${RED}Error: Post slug is required${NC}"
    exit 1
fi

# Language selection
echo
echo "Language:"
echo "  1) English"
echo "  2) Mandarin (Chinese)"
read -p "Select [1]: " lang_choice

case $lang_choice in
    2)
        lang="zh"
        lang_suffix=".zh"
        ;;
    *)
        lang="en"
        lang_suffix=""
        ;;
esac

# Format selection
echo
echo "Format:"
echo "  1) Text-only (single .md file)"
echo "  2) Images (page bundle with folder)"
read -p "Select [1]: " format_choice

case $format_choice in
    2)
        format="bundle"
        ;;
    *)
        format="single"
        ;;
esac

# Build the path and create the post
if [ "$format" = "bundle" ]; then
    # Page bundle: posts/slug/index.md or posts/slug/index.zh.md
    post_path="posts/${slug}/index${lang_suffix}.md"
else
    # Single file: posts/slug.md or posts/slug.zh.md
    post_path="posts/${slug}${lang_suffix}.md"
fi

echo
echo -e "${GREEN}Creating: content/${post_path}${NC}"

hugo new "$post_path"

# Get the full path to the created file
full_path="content/${post_path}"

echo
echo -e "${GREEN}Post created successfully!${NC}"
echo -e "Edit: ${BLUE}${full_path}${NC}"

# Optionally open in editor
if [ -n "$EDITOR" ]; then
    read -p "Open in $EDITOR? [Y/n]: " open_editor
    if [ "$open_editor" != "n" ] && [ "$open_editor" != "N" ]; then
        $EDITOR "$full_path"
    fi
fi
