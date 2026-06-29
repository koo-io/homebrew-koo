#!/bin/bash
#
# Regenerate Formula/koo.rb from templates/koo-template.txt by substituting the {PLACEHOLDER} tokens
# with values passed in via environment variables.
#
# Linux binaries are REQUIRED. macOS binaries are OPTIONAL: if both SHA_X86_64_DARWIN and
# SHA_AARCH64_DARWIN are set, an `on_macos` block is added so the formula installs on macOS too.
# (The local release scripts build macOS and pass them; a Linux-only CI build omits them and this
# renders a Linux-only formula without erroring.)
#
# Invoked from koo-cli's release flow (CI .gitlab-ci.yml publish:homebrew and the local
# scripts/release.sh): clone this tap, export the variables, run this, then commit & push Formula/koo.rb.

set -eo pipefail

script_dir="$(cd "$(dirname "$0")" && pwd)"
template_file_path="$script_dir/../templates/koo-template.txt"
koo_formula_file_path="$script_dir/../Formula/koo.rb"

# Required environment variables (Linux glibc — what Homebrew-on-Linux uses).
for env_var in URL VERIFIED VERSION SHA_X86_64 SHA_AARCH64; do
  if [ -z "${!env_var}" ]; then
    echo "$env_var environment variable is not set" >&2
    exit 1
  fi
done

content="$(cat "$template_file_path")"

# Build the optional macOS block (empty unless both darwin SHAs are provided). Values are interpolated
# here, so the block contains no remaining placeholders.
macos_block=""
if [ -n "${SHA_X86_64_DARWIN:-}" ] && [ -n "${SHA_AARCH64_DARWIN:-}" ]; then
  macos_block="
  on_macos do
    if Hardware::CPU.arm?
      url \"${URL}/koo-aarch64-apple-darwin.tar.gz\",
          verified: \"${VERIFIED}\"
      sha256 \"${SHA_AARCH64_DARWIN}\"
    else
      url \"${URL}/koo-x86_64-apple-darwin.tar.gz\",
          verified: \"${VERIFIED}\"
      sha256 \"${SHA_X86_64_DARWIN}\"
    end
  end
"
fi

# Literal substitution via bash parameter expansion (no sed → no delimiter/metacharacter/injection
# issues, and multi-line replacements like the macOS block work). Substitute {ON_MACOS} first.
content="${content//\{ON_MACOS\}/$macos_block}"
content="${content//\{URL\}/$URL}"
content="${content//\{VERIFIED\}/$VERIFIED}"
content="${content//\{VERSION\}/$VERSION}"
content="${content//\{SHA_X86_64\}/$SHA_X86_64}"
content="${content//\{SHA_AARCH64\}/$SHA_AARCH64}"

printf '%s\n' "$content" > "$koo_formula_file_path"
