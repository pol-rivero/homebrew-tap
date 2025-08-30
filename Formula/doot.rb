class Doot < Formula
  desc     "Fast, simple and intuitive dotfiles manager that just gets the job done"
  homepage "https://github.com/pol-rivero/doot"
  version  "0.6.4"
  license  "MIT"
  head     "https://github.com/pol-rivero/doot.git", branch: "main"

  depends_on "git-crypt"
  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.4/doot-darwin-arm64"
      sha256 "b83969512303ff5d9bed36f275a7ccdc7d16df5cfc634cee35b00ec7e8717431"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.4/doot-darwin-x86_64"
      sha256 "28a93f0cc6270684c924c37791244f11da11a8c8627c17926ad9eea4c7e006a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.4/doot-linux-arm64"
      sha256 "ae532b90e3f0a4fc6e39fce3a2a4bc17a9bb71c48f2aaa6643b915a0d4d1c8e7"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.4/doot-linux-x86_64"
      sha256 "7ed2bcb0e281111807079898c5a266017206738de123bba089293b59742724f2"
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
