class Doot < Formula
  desc     "Fast, simple and intuitive dotfiles manager that just gets the job done"
  homepage "https://github.com/pol-rivero/doot"
  version  "0.4.5"
  license  "MIT"
  head     "https://github.com/pol-rivero/doot.git", branch: "main"

  depends_on "git-crypt"
  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.4.5/doot-darwin-arm64"
      sha256 "235b981a322f6e81b86e22a3e06e5cc3d6f5b8e2a0c620f1eb06a8fc6dbdf97e"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.4.5/doot-darwin-x86_64"
      sha256 "023c3346c5d203e89fffbbd7cfa42cadfe1d9f6e9c94ef520aa571badf3a84cc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.4.5/doot-linux-arm64"
      sha256 "3501f1bf87beb5ee6f4ce3fa0e0b23a44a22f8061c313cc336f31de13eac1aa2"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.4.5/doot-linux-x86_64"
      sha256 "7596181e8ce01e9034dde20c5463ba84e56179f77061b01f305aad336372a5de"
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
