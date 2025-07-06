class Doot < Formula
  desc     "Fast, simple and intuitive dotfiles manager that just gets the job done"
  homepage "https://github.com/pol-rivero/doot"
  version  "0.6.0"
  license  "MIT"
  head     "https://github.com/pol-rivero/doot.git", branch: "main"

  depends_on "git-crypt"
  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.0/doot-darwin-arm64"
      sha256 "440e654d42ef6d2d718f45747b4c63b9cd6242cf837b8d1651a369b513482541"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.0/doot-darwin-x86_64"
      sha256 "d623ee0a8b1ee2622cad0ac6c6575abc41b33f02109d0e3791b7625e2f12a0c1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.0/doot-linux-arm64"
      sha256 "3c82026f2ba104239b06da4e8d4b664a19b264e65e5208e61760c3560b46fc67"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.0/doot-linux-x86_64"
      sha256 "e243bf2512115487576acdd8e571b692b0943afc90a6206f0ce487115a210532"
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
