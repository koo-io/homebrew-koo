class Koo < Formula
  desc "Deploy to Koo from your terminal"
  homepage "https://koo.io"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.koo0.io/koo/v0.2.1/koo-aarch64-apple-darwin.tar.gz",
          verified: "downloads.koo0.io/"
      sha256 "2eff93e019f7726f3acafdb1e049954a43bf243cbab1acfc33bee32ddf9daec1"
    else
      url "https://downloads.koo0.io/koo/v0.2.1/koo-x86_64-apple-darwin.tar.gz",
          verified: "downloads.koo0.io/"
      sha256 "6c77c14ec0a1726a26276fd01a2fef5f56317e9a57a346862edb131ae87db998"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.koo0.io/koo/v0.2.1/koo-aarch64-unknown-linux-gnu.tar.gz",
          verified: "downloads.koo0.io/"
      sha256 "4b2fad2fba977d0e6d8c019fcc721df41b3c1292d5ecec28791a439b56aaf834"
    else
      url "https://downloads.koo0.io/koo/v0.2.1/koo-x86_64-unknown-linux-gnu.tar.gz",
          verified: "downloads.koo0.io/"
      sha256 "a1567139a81de0303381d27f565e4addbaad52b81145b099017fb0abce789f74"
    end
  end

  def install
    bin.install "koo"
  end

  test do
    assert_match "koo", shell_output("#{bin}/koo --help")
  end
end
