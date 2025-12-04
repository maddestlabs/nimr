#!/bin/bash

# Build script for nimr - Nim + Raylib + WebAssembly
# Compiles nimr.nim to WebAssembly for GitHub Pages

set -e  # Exit on error

echo "==================================="
echo "Building nimr for WebAssembly"
echo "==================================="

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Setup Emscripten environment
echo -e "${BLUE}Setting up Emscripten environment...${NC}"
source ./emsdk/emsdk_env.sh

# Add Nim to PATH
export PATH=/home/codespace/.nimble/bin:$PATH

# Create docs directory if it doesn't exist
echo -e "${BLUE}Creating docs directory...${NC}"
mkdir -p docs

# Clean previous builds
echo -e "${BLUE}Cleaning previous builds...${NC}"
rm -f docs/index.html docs/index.js docs/index.wasm

# Compile nimr.nim to WebAssembly
echo -e "${BLUE}Compiling nimr.nim to WebAssembly...${NC}"
nim c -d:emscripten -d:release --mm:orc src/nimr.nim

# Check if build was successful
if [ -f "docs/index.html" ]; then
    echo -e "${GREEN}Build successful!${NC}"
    echo -e "${GREEN}Output files:${NC}"
    ls -lh docs/index.*
    echo ""
    echo -e "${BLUE}To test locally:${NC}"
    echo "  cd docs && python3 -m http.server 8000"
    echo "  Then open http://localhost:8000"
    echo ""
    echo -e "${BLUE}For GitHub Pages:${NC}"
    echo "  1. Commit and push the docs/ directory"
    echo "  2. Enable GitHub Pages in repository settings"
    echo "  3. Set source to 'main' branch, '/docs' folder"
else
    echo -e "${RED}Build failed! Output files not found.${NC}"
    exit 1
fi
