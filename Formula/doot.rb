class Doot < Formula
  desc     "Fast, simple and intuitive dotfiles manager that just gets the job done"
  homepage "https://github.com/pol-rivero/doot"
  version  "0.6.7"
  license  "MIT"
  head     "https://github.com/pol-rivero/doot.git", branch: "main"

  depends_on "git-crypt"
  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.7/doot-darwin-arm64"
      sha256 "f4d02df6f5ce6bfc7f00e443e9b154afabcbd4af19bbd24a72c62b4967d40b6a"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.7/doot-darwin-x86_64"
      sha256 "299d14ae4219bcb635ae81132c8868277bf1d057d2e7d1a9899fb1aef626bbd1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.7/doot-linux-arm64"
      sha256 "d958b3436124b6fff22b57b33be086155092275b00cecbe00eb6120295aa96f5"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.7/doot-linux-x86_64"
      sha256 "472b5b0d4e2b5d0920369d290253bc7187377f659f2a333d227f6ef7a43c8014"
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
