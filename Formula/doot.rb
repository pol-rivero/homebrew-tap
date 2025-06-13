class Doot < Formula
  desc     "Fast, simple and intuitive dotfiles manager that just gets the job done"
  homepage "https://github.com/pol-rivero/doot"
  version  "0.5.0"
  license  "MIT"
  head     "https://github.com/pol-rivero/doot.git", branch: "main"

  depends_on "git-crypt"
  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.5.0/doot-darwin-arm64"
      sha256 "db5d17b51c99d2c0063f36753e1b7c4638ef273be8aa97a242e899f7963556c9"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.5.0/doot-darwin-x86_64"
      sha256 "eba47937b9d01b0d87b5069b1b6150fee39529a0bf29b47ec680118e7501aa2d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.5.0/doot-linux-arm64"
      sha256 "acfe59be2e0f56ee3aa51b15bd9552a2d1fd8e8d6682f79f44753b1aa2c64934"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.5.0/doot-linux-x86_64"
      sha256 "570e01ecc78306402c859078a992b395eac79280b0924f4ca65399680ca88b7f"
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
