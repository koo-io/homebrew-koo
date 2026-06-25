# Koo — Homebrew Tap

The official [Koo](https://koo.io) Homebrew [Tap](https://docs.brew.sh/Taps).

## Installation

```bash
brew tap koo-io/koo
brew install koo
```

## Update

```bash
brew update && brew upgrade
```

## Notes

- Linux-only (`x86_64` + `aarch64`) for now. macOS support will be added once macOS
  release builds exist.
- Binaries are hosted on Cloudflare R2 and served from `https://downloads.koo0.io`.
- `Formula/koo.rb` is generated from `templates/koo-template.txt` by `src/koo-update.sh`
  and pushed automatically by koo-cli's release pipeline — edit the template, not the
  generated formula.
