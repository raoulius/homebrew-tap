cask "mousesnap" do
  version "1.4.0"
  sha256 "0529b5a88429454feb56665f203ea03546164b0326dbec40af6f783d17b803f3"

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

  # Not notarized: clear the quarantine flag so Gatekeeper doesn't block launch.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/MouseSnap.app"],
        writable_paths: ["MouseSnap.app"],
        writable_base:  :appdir
  end

  uninstall quit: "local.mousesnap"

  zap trash: "~/Library/Preferences/local.mousesnap.plist"
end
