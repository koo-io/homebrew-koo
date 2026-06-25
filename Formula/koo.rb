class Koo < Formula
  desc "Deploy to Koo from your terminal"
  homepage "https://koo.io"
  version "0.1.6"
  license "MIT"

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.koo0.io/koo/v0.1.6/koo-aarch64-unknown-linux-gnu.tar.gz",
          verified: "downloads.koo0.io/"
      sha256 "8a8a29679754b6d2359f602194953fad0d13da1ada46ab38923b5acc80a383b3"
    else
      url "https://downloads.koo0.io/koo/v0.1.6/koo-x86_64-unknown-linux-gnu.tar.gz",
          verified: "downloads.koo0.io/"
      sha256 "df623856d59667e96c96186bb483de6e720e74d119368182db8e70814cf90fb6"
    end
  end

  def install
    bin.install "koo"
  end

  test do
    assert_match "koo", shell_output("#{bin}/koo --help")
  end
end
