class Koo < Formula
  desc "Deploy to Koo from your terminal"
  homepage "https://koo.io"
  version "0.1.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.koo0.io/koo/v0.1.7/koo-aarch64-apple-darwin.tar.gz",
          verified: "downloads.koo0.io/"
      sha256 "6486eb903eaf304a58011d28298c110edf267aa6e506d281a9448766fb8fc9a8"
    else
      url "https://downloads.koo0.io/koo/v0.1.7/koo-x86_64-apple-darwin.tar.gz",
          verified: "downloads.koo0.io/"
      sha256 "e18dc8d1d4feb272edd2dbfbd12eb2367cc493c68c73cd94e7867c706dc06d4f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.koo0.io/koo/v0.1.7/koo-aarch64-unknown-linux-gnu.tar.gz",
          verified: "downloads.koo0.io/"
      sha256 "d14e2a1166e2a83909715ae835d4a61fd3b24f62d568bc8042256c534138b012"
    else
      url "https://downloads.koo0.io/koo/v0.1.7/koo-x86_64-unknown-linux-gnu.tar.gz",
          verified: "downloads.koo0.io/"
      sha256 "f5eea617404c0e43257f939a6679f8e830b70a1959e80b7c27443e398eb6232a"
    end
  end

  def install
    bin.install "koo"
  end

  test do
    assert_match "koo", shell_output("#{bin}/koo --help")
  end
end
