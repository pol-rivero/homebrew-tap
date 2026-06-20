cask "github-desktop-plus" do
  arch arm: "arm64", intel: "x64"

  version "3.5.13.2"
  sha256 arm:   "e7e5864ab7eaca0ed3a1849f43409cc99e198ee7f90ce29ccb90701c975a3d0e",
         intel: "e6a2525260b840d97d7e1a2c8a645e91aa32555b55ee83011fec27cbdd3e7d46"

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
