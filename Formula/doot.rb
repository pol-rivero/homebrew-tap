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
      sha256 "629baedbef37ea91de46e1fa7c2546e62814d5f16114912ba60457c37d2e44a3"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.8/doot-darwin-x86_64"
      sha256 "3c347e201292bdde55117767993db683f55b4e2a1b7bf6ac6e2be26279f7076e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.8/doot-linux-arm64"
      sha256 "76b3144e7e6e90fde0f44ef82f48a77c446f0a3a9c915f08c0e464148d808c5b"
    end
    on_intel do
      url "https://github.com/pol-rivero/doot/releases/download/0.6.8/doot-linux-x86_64"
      sha256 "fb1b27f06b70c3359500674d4a2e436312936a99c589877c108d65babaef652b"
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
