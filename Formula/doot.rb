class Doot < Formula
  desc     "Fast, simple and intuitive dotfiles manager that just gets the job done"
  homepage "https://github.com/pol-rivero/doot"
  version  "0.6.3"
  license  "MIT"
  head     "https://github.com/pol-rivero/doot.git", branch: "main"

  depends_on "git-crypt"
  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.3/doot-darwin-arm64"
      sha256 "ab005cd605e4d5fdd2f907323644d3ff44131ae5f43c2933bb9f3cdb9536e1f2"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.3/doot-darwin-x86_64"
      sha256 "a9c8ae393c5de5886ffe984c27474521296a6bd732a9235a7ff98c8ef321d6a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.3/doot-linux-arm64"
      sha256 "5b1ee4400ed080f779a30eef24642655c9095a827f80b0c263876cc64103972b"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.3/doot-linux-x86_64"
      sha256 "87292c8b45732bbb4d958f1bb09e77da9d9aa571bb0a2c5d8afb253739e7bf3e"
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
