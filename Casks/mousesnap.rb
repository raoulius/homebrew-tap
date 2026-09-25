cask "mousesnap" do
  version "1.1.0"
  sha256 "e37fe2cf03e48aeb40a2d81448354c4492d678a14ee054dd499bf0157f9a9581"

  url "https://github.com/raoulius/mousesnap/releases/download/v#{version}/MouseSnap.zip"
  name "MouseSnap"
  desc "Hotkeys to jump the cursor to the center of any monitor"
  homepage "https://github.com/raoulius/mousesnap"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "MouseSnap.app"

  uninstall quit: "local.mousesnap"

  zap trash: "~/Library/Preferences/local.mousesnap.plist"
end
