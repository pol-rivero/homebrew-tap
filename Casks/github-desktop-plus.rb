cask "github-desktop-plus" do
  arch arm: "arm64", intel: "x64"

  version "3.5.7.3"
  sha256 arm:   "991d449b56258499b05e924bb2760732a54268104c8b1d8fdc72f2f6f4a35ab2",
         intel: "0fea17742d6d0c2c68a6c192b3516abdc5f8ef617cfd6ebd83cf8cfcb3ef0198"

  url "https://github.com/pol-rivero/github-desktop-plus/releases/download/v#{version}/GitHubDesktopPlus-v#{version}-macOS-#{arch}.zip"
  name "GitHub Desktop Plus"
  desc "Fork of GitHub Desktop with extra features and improvements"
  homepage "https://github.com/pol-rivero/github-desktop-plus"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :monterey"

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
