class Doot < Formula
  desc     "Fast, simple and intuitive dotfiles manager that just gets the job done"
  homepage "https://github.com/pol-rivero/doot"
  version  "0.4.7"
  license  "MIT"
  head     "https://github.com/pol-rivero/doot.git", branch: "main"

  depends_on "git-crypt"
  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.4.7/doot-darwin-arm64"
      sha256 "016ad6e0e6415e3f737a0c8012ab392a95840b9ff40c3e04fbec60b0f927f307"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.4.7/doot-darwin-x86_64"
      sha256 "8973bc278ea595eb44f30d343f6f1d424659ab3dee4f02287a03269730bd8bc7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.4.7/doot-linux-arm64"
      sha256 "5b3a92a0bb3d52d03ba77239ac20a695d315e320f03c27d8b65a9be48f737763"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.4.7/doot-linux-x86_64"
      sha256 "4b4291c52d6884e1ac50dff032fa8e1e0e22d14d5877d9bd23d1a8acf2bda72e"
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
