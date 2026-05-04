class Doot < Formula
  desc     "Fast, simple and intuitive dotfiles manager that just gets the job done"
  homepage "https://github.com/pol-rivero/doot"
  version  "0.6.8"
  license  "MIT"
  head     "https://github.com/pol-rivero/doot.git", branch: "main"

  depends_on "git-crypt"
  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.8/doot-darwin-arm64"
      sha256 "f99154a08b63ee831c63741555a8a4c7c5762ebef64041983272d7095c5196c8"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.8/doot-darwin-x86_64"
      sha256 "9fdc54a95c5c4ff1bec304176815bb60bc8537a2db829c2519ab8360d5499748"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.8/doot-linux-arm64"
      sha256 "371e900991874dca9928752db57d14a941b7b358486b0b0df0e6c6ae7120507f"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.8/doot-linux-x86_64"
      sha256 "03534d9322d69c8fb2796c9cda6b58f6d48fdbd8939147e8e7d24557470de6c2"
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
