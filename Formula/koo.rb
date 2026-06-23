class Koo < Formula
  desc "Deploy to Koo from your terminal"
  homepage "https://koo.io"
  version "0.1.0"
  license "MIT"

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.koo.io/koo/v0.1.0/koo-aarch64-unknown-linux-gnu.tar.gz",
          verified: "downloads.koo.io/"
      sha256 "1111111111111111111111111111111111111111111111111111111111111111"
    else
      url "https://downloads.koo.io/koo/v0.1.0/koo-x86_64-unknown-linux-gnu.tar.gz",
          verified: "downloads.koo.io/"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "koo"
  end

  test do
    assert_match "koo", shell_output("#{bin}/koo --help")
  end
end
