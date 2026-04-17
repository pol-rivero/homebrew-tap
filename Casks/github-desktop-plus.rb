cask "github-desktop-plus" do
  arch arm: "arm64", intel: "x64"

  version "3.5.8.1"
  sha256 arm:   "f49f3e7a579d408b3df26d3c0c1207d0cb2ec33e148a6ee78e463f9e7a2254d2",
         intel: "0d3e87b08cfe4d312a0465be86b9e6b25f51b15171cb409233bc677084765cab"

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
