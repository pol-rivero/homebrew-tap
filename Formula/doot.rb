class Doot < Formula
  desc     "Fast, simple and intuitive dotfiles manager that just gets the job done"
  homepage "https://github.com/pol-rivero/doot"
  version  "0.4.4"
  license  "MIT"
  head     "https://github.com/pol-rivero/doot.git", branch: "main"

  depends_on "git"
  depends_on "git-crypt"

  on_macos do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.4.4/doot-darwin-arm64"
      sha256 "d99cbb26d6bdb00d34e1a0f735ddf1a781936c25a51ef563383fe584a454b7bb"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.4.4/doot-darwin-x86_64"
      sha256 "fb719527425fdb0aa5f8aae471148fc064e0d24c7d2b52f261b43a33a4c98c9b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.4.4/doot-linux-arm64"
      sha256 "87c891961ef2c6633d1795f5d73ad4099463aba3a534366d18c101e726ce186e"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.4.4/doot-linux-x86_64"
      sha256 "51b751c84afa163cf09024b2a6b081a4ad0cd6bfe725e2c288706597ef5abe7a"
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
