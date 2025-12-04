# nimr

🎮 Simple animated raylib example in Nim compiled to WebAssembly for easy viewing on GitHub Pages.

[![Build and Deploy](https://github.com/maddestlabs/nimr/actions/workflows/deploy.yml/badge.svg)](https://github.com/maddestlabs/nimr/actions/workflows/deploy.yml)

## 🚀 Live Demo

**[View Demo on GitHub Pages](https://maddestlabs.github.io/nimr/)**

## ✨ Features

- Bouncing ball animation with color changes
- Built with [Nim](https://nim-lang.org) + [naylib](https://github.com/planetis-m/naylib) + [raylib](https://www.raylib.com)
- Compiled to WebAssembly using Emscripten
- Automatic deployment to GitHub Pages via GitHub Actions

## 🛠️ Building Locally

### Prerequisites

- [Nim](https://nim-lang.org/install.html) (2.0+)
- [Emscripten](https://emscripten.org/docs/getting_started/downloads.html)
- [Nimble](https://github.com/nim-lang/nimble) (comes with Nim)

### Build for Web (WASM)

```bash
# Install dependencies
nimble install -y

# Build for web (output in docs/)
nim c -d:emscripten src/nimr.nim

# Serve locally (optional)
cd docs && python3 -m http.server 8080
```

### Build for Desktop (Native)

```bash
# Install dependencies
nimble install -y

# Build for desktop
nim c -d:release src/nimr.nim
```

## 📁 Project Structure

```
nimr/
├── src/
│   └── nimr.nim          # Main application source
├── web/
│   └── shell.html        # HTML template for WASM
├── docs/                  # Generated WASM output (GitHub Pages)
├── nim.cfg               # Nim configuration
├── nimr.nimble           # Package definition
└── .github/workflows/
    └── deploy.yml        # CI/CD workflow
```

## 📄 License

MIT License - see [LICENSE](LICENSE) for details.
