class Koo < Formula
  desc "Deploy to Koo from your terminal"
  homepage "https://koo.io"
  version "0.1.10"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.koo0.io/koo/v0.1.10/koo-aarch64-apple-darwin.tar.gz",
          verified: "downloads.koo0.io/"
      sha256 "a80291a0736e52904b11c0cdd71f377ea0eb3c98711250f9106294ac253e7228"
    else
      url "https://downloads.koo0.io/koo/v0.1.10/koo-x86_64-apple-darwin.tar.gz",
          verified: "downloads.koo0.io/"
      sha256 "49e43141a1bcad97c295e3df05d0c522fb59cfda084d8038f8c3291a09a4ca06"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.koo0.io/koo/v0.1.10/koo-aarch64-unknown-linux-gnu.tar.gz",
          verified: "downloads.koo0.io/"
      sha256 "456ddd55ab2cf0e9e3007f40f6a31b9d9794a1fa2bb9e435c36477733aef13ea"
    else
      url "https://downloads.koo0.io/koo/v0.1.10/koo-x86_64-unknown-linux-gnu.tar.gz",
          verified: "downloads.koo0.io/"
      sha256 "4b0ccedcb3fdfcd328efff6e9cc1023c4aff2c241f18f98c6147450f138e379b"
    end
  end

  def install
    bin.install "koo"
  end

  test do
    assert_match "koo", shell_output("#{bin}/koo --help")
  end
end
