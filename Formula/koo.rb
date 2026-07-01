class Koo < Formula
  desc "Deploy to Koo from your terminal"
  homepage "https://koo.io"
  version "0.1.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://downloads.koo0.io/koo/v0.1.8/koo-aarch64-apple-darwin.tar.gz",
          verified: "downloads.koo0.io/"
      sha256 "5e554fe23bba6d20ea823d407d922a73ae95e0dc4069581d4f32c9884eb72c66"
    else
      url "https://downloads.koo0.io/koo/v0.1.8/koo-x86_64-apple-darwin.tar.gz",
          verified: "downloads.koo0.io/"
      sha256 "b4e625dff9e9e73a0b4c121ece317d4102ab91084db1dda10d113ffd20bd2457"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://downloads.koo0.io/koo/v0.1.8/koo-aarch64-unknown-linux-gnu.tar.gz",
          verified: "downloads.koo0.io/"
      sha256 "8f4e0719c07df05cf4a78ac924f1c08aca70a7232fac47c9af0c738f835b614e"
    else
      url "https://downloads.koo0.io/koo/v0.1.8/koo-x86_64-unknown-linux-gnu.tar.gz",
          verified: "downloads.koo0.io/"
      sha256 "20373c191bffc516b4029066e0912387afcd3cee20a202536e6a1ae09768af6c"
    end
  end

  def install
    bin.install "koo"
  end

  test do
    assert_match "koo", shell_output("#{bin}/koo --help")
  end
end
