class Doot < Formula
  desc     "Fast, simple and intuitive dotfiles manager that just gets the job done"
  homepage "https://github.com/pol-rivero/doot"
  version  "0.6.2"
  license  "MIT"
  head     "https://github.com/pol-rivero/doot.git", branch: "main"

  depends_on "git-crypt"
  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.2/doot-darwin-arm64"
      sha256 "92926b2155f72d43f5beb587f250ac4edb465925d9871dc53b719a9c01560bcb"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.2/doot-darwin-x86_64"
      sha256 "29f6d861fcbf523904ee05811817cb98c83f50f24a00a22aa370b818f9e567b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.2/doot-linux-arm64"
      sha256 "3e5171b7b7b4a3a955495c860729f358e4993e50f298bc468a3c6396663cefc5"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.2/doot-linux-x86_64"
      sha256 "b355f894cb3f82fcb3b9ecfceb02c77bdefa10636f870e08d780a20db2f7a6ed"
    end
  end

  def install
    mv Dir["doot-*"].first, "doot"
    chmod 0755, "doot"
    bin.install "doot"

    generate_completions_from_executable(bin/"doot", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/doot --version")
  end
end
