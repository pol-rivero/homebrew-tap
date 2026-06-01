cask "github-desktop-plus" do
  arch arm: "arm64", intel: "x64"

  version "3.5.12.0"
  sha256 arm:   "7d983c19743c9e1ac823e7ebabe74ec2a273d0d58d9cb85cfb520dd9cf877e94",
         intel: "32752b5b2691e74bace521392d63b08c619b28f4af602f97f313763110671f9a"

  url "https://github.com/pol-rivero/github-desktop-plus/releases/download/v#{version}/GitHubDesktopPlus-v#{version}-macOS-#{arch}.zip"
  name "GitHub Desktop Plus"
  desc "Fork of GitHub Desktop with extra features and improvements"
  homepage "https://github.com/pol-rivero/github-desktop-plus"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :monterey

  app "GitHub Desktop Plus.app"
  binary "#{appdir}/GitHub Desktop Plus.app/Contents/Resources/app/static/github-desktop-plus-cli.sh",
         target: "github-desktop-plus-cli"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/GitHub Desktop Plus.app"]
  end

  zap trash: [
    "~/Library/Application Support/GitHub Desktop Plus",
    "~/Library/Logs/GitHub Desktop Plus",
  ]
end
