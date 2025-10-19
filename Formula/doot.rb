class Doot < Formula
  desc     "Fast, simple and intuitive dotfiles manager that just gets the job done"
  homepage "https://github.com/pol-rivero/doot"
  version  "0.6.6"
  license  "MIT"
  head     "https://github.com/pol-rivero/doot.git", branch: "main"

  depends_on "git-crypt"
  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.6/doot-darwin-arm64"
      sha256 "0137fbeb0fff6744fb8ab0a00ed718dcd7f2c0e6b6c231e26059208d5ade55fb"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.6/doot-darwin-x86_64"
      sha256 "808b66042ff239f77dc2e681217fa386910e7f90425035f9b5925a15835d6637"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.6/doot-linux-arm64"
      sha256 "49b1b2c2ca2ffd2641d67abf488de0bf8fbe92b27a40a969041c2dc31b1a6d6d"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.6/doot-linux-x86_64"
      sha256 "3ce2de5b09534492b06ce094af67f97006a3895c90662e93f93272462785b7df"
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
