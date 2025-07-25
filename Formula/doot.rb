class Doot < Formula
  desc     "Fast, simple and intuitive dotfiles manager that just gets the job done"
  homepage "https://github.com/pol-rivero/doot"
  version  "0.6.1"
  license  "MIT"
  head     "https://github.com/pol-rivero/doot.git", branch: "main"

  depends_on "git-crypt"
  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.1/doot-darwin-arm64"
      sha256 "58af8b5b09b0a9d620fa95a306f20bf1c5a763843351e51b980ef798b0f17ee1"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.1/doot-darwin-x86_64"
      sha256 "b8c87b411126ca4b61f36114ac97dcf4efd3a88d256f4a3ac4edd28b251e7c9c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.1/doot-linux-arm64"
      sha256 "32cb52b3c0cfd17355aff6284fdebf1c17e151eecafddb86b76e1c309ffad22f"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.1/doot-linux-x86_64"
      sha256 "e384432d3a17bebd8f55c71a4f2660f63616d3440846f169010d685a12a9a9f8"
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
