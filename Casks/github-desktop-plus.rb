cask "github-desktop-plus" do
  arch arm: "arm64", intel: "x64"

  version "3.5.7.1"
  sha256 arm:   "e7908e79958ee37c68f32af651dd0660d6e83f4beb4e2f71ff56355966f13d44",
         intel: "00e8808a3168c8e3778368e91312573474615ee1e8eb13137305cab198699ca2"

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
  binary "#{appdir}/GitHub Desktop Plus.app/Contents/Resources/app/static/github.sh",
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
