class Koo < Formula
  desc "Deploy to Koo from your terminal"
  homepage "https://koo.io"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.koo0.io/koo/v0.2.0/koo-aarch64-apple-darwin.tar.gz",
          verified: "downloads.koo0.io/"
      sha256 "0a03aef30b4ddf854dd36b763734362b10dd2ca4af121c30aa5837b5dcd1e7e0"
    else
      url "https://downloads.koo0.io/koo/v0.2.0/koo-x86_64-apple-darwin.tar.gz",
          verified: "downloads.koo0.io/"
      sha256 "39c3eac74b188d5c7cb322dbb5f88faef2359a238bf4c82c9b8ed8c36e7101f7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.koo0.io/koo/v0.2.0/koo-aarch64-unknown-linux-gnu.tar.gz",
          verified: "downloads.koo0.io/"
      sha256 "655c693cdc18fdbfc09dc4e16aa40fc8ce76d62091caa584f833a5d732585a17"
    else
      url "https://downloads.koo0.io/koo/v0.2.0/koo-x86_64-unknown-linux-gnu.tar.gz",
          verified: "downloads.koo0.io/"
      sha256 "a558e6876bda124fc9698755f1a3d70a3d20efb29aa8da8cd4c3bb399fe5fb86"
    end
  end

  def install
    bin.install "koo"
  end

  test do
    assert_match "koo", shell_output("#{bin}/koo --help")
  end
end
