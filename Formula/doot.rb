class Doot < Formula
  desc     "Fast, simple and intuitive dotfiles manager that just gets the job done"
  homepage "https://github.com/pol-rivero/doot"
  version  "0.6.5"
  license  "MIT"
  head     "https://github.com/pol-rivero/doot.git", branch: "main"

  depends_on "git-crypt"
  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.5/doot-darwin-arm64"
      sha256 "8de1ed00cdfcf03535d7c5c3f193f6bd07cf3482c492bf8ae3a3cb81efd3dc78"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.5/doot-darwin-x86_64"
      sha256 "5bdb3d00a08a2bcfb66d1948db2357bdc1bfdbe589d61c2586907e58c9b6f53d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.5/doot-linux-arm64"
      sha256 "c45bf541867c84e0baaefb0b1845d302531ca093d9eadab45b4c140651b791d7"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.5/doot-linux-x86_64"
      sha256 "205058655cd81d0c490181afa998eb654ded33d0a9748033c4ee4f39df27ee23"
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
