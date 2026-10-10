class Doot < Formula
  desc     "Fast, simple and intuitive dotfiles manager that just gets the job done"
  homepage "https://github.com/pol-rivero/doot"
  version  "0.7.0"
  license  "MIT"
  head     "https://github.com/pol-rivero/doot.git", branch: "main"

  depends_on "git-crypt"
  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.7.0/doot-darwin-arm64"
      sha256 "336ed740eec5b636e9c9575275b769cd35aa000f27624534a883dd365692eb55"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.7.0/doot-darwin-x86_64"
      sha256 "3518c94276d222f1027b3b87e1d7b01ec400c48ca977a4bbde7c42edf112e5e6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.7.0/doot-linux-arm64"
      sha256 "c1e755b3ad2ad45583eba0cf50f728e71952423c366a32cb88fd51aec8e6033a"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.7.0/doot-linux-x86_64"
      sha256 "ad25b1d56f992f561179df70e28e892cfc3370d88b189ab2ddd9ae165c15de49"
    end
  end

  def install
    mv Dir["doot-*"].first, "doot"
    chmod 0755, "doot"
    bin.install "doot"

    generate_completions_from_executable(bin/"doot", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/doot version")
  end
end
