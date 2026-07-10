class Koo < Formula
  desc "Deploy to Koo from your terminal"
  homepage "https://koo.io"
  version "0.1.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.koo0.io/koo/v0.1.9/koo-aarch64-apple-darwin.tar.gz",
          verified: "downloads.koo0.io/"
      sha256 "9141418f3e9326b979fbfb5ff8ce2d32eaf5d141be826207eaba8d0d88850f54"
    else
      url "https://downloads.koo0.io/koo/v0.1.9/koo-x86_64-apple-darwin.tar.gz",
          verified: "downloads.koo0.io/"
      sha256 "8fef01148ff6438f2307c3b63a7b51d17f2e5687c8586af3d8aaa3c84db28bb3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.koo0.io/koo/v0.1.9/koo-aarch64-unknown-linux-gnu.tar.gz",
          verified: "downloads.koo0.io/"
      sha256 "8a141bacc91f24e3b9d84504820a4f3d5cd6e3d486eafdbc26872b5264dc6100"
    else
      url "https://downloads.koo0.io/koo/v0.1.9/koo-x86_64-unknown-linux-gnu.tar.gz",
          verified: "downloads.koo0.io/"
      sha256 "57b453333869db23abf231ba4fa844db95f7a47d9a624667f1cabbf876df9561"
    end
  end

  def install
    bin.install "koo"
  end

  test do
    assert_match "koo", shell_output("#{bin}/koo --help")
  end
end
