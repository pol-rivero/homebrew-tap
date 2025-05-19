class Doot < Formula
  desc     "Fast, simple and intuitive dotfiles manager that just gets the job done"
  homepage "https://github.com/pol-rivero/doot"
  version  "0.4.6"
  license  "MIT"
  head     "https://github.com/pol-rivero/doot.git", branch: "main"

  depends_on "git-crypt"
  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.4.6/doot-darwin-arm64"
      sha256 "e0ecd19a61dbad0be478d7bb5184346e39493f5e19fe0d33922a1b90bfad6926"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.4.6/doot-darwin-x86_64"
      sha256 "89dc86ca37046eb58d43ebdcbd73cec04b8e2163a9af5c9921d4826accb898e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.4.6/doot-linux-arm64"
      sha256 "579a5240374ff0cc07e73fb6cc8d7060105e9166e451ff7f2a57fca27f4dbb7c"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.4.6/doot-linux-x86_64"
      sha256 "8a16baaa49d5d31f2d37348b6b3a3de6356bcb95195b62af4932f27e61eb9816"
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
