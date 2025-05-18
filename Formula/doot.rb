class Doot < Formula
  desc     "A fast, simple and intuitive dotfiles manager that just gets the job done"
  homepage "https://github.com/pol-rivero/doot"
  license  "MIT"
  version  "0.4.4"
  head     "https://github.com/pol-rivero/doot.git", branch: "main"

  depends_on "git"
  depends_on "git-crypt"

  on_macos do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.4.4/doot-darwin-arm64"
      sha256 "288183b3cdf8a0bbcae7702013264cd8e8a562f532fb17219f4731d5b9f54c2a"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.4.4/doot-darwin-x86_64"
      sha256 "d5f4585e5f3c803ccb1adac4818df4a81ebadb3ad6604454d9f48029e2c0cb4f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.4.4/doot-linux-arm64"
      sha256 "525290e0e9fdd1d2cede163d36a747d79ad3899ace60da0de9f2f0f5bfaebc79"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.4.4/doot-linux-x86_64"
      sha256 "691130c100f0e0fa74f5a0f0e03a17745588c38495d0e24ed8e87423c0bc7c73"
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
