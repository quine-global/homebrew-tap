cask "quintodrome" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.0.0-alpha.11"
  sha256 arm:   "e9144c8beafcb67e3a48764754faec1583a1469ca0393a14698b9dd9eca1125b",
         intel: "6e1800e00ba4c69b1a76f197420b9179a73c24d4fc1eb86412a6ccb34ee91d02"

  url "https://forge.in.quineglobal.com/quine-global/quintodrome/releases/download/v#{version}/Quintodrome-#{arch}-apple-darwin.app.zip"
  name "Quintodrome"
  desc "Desktop app wrapping the Navidrome music server"
  homepage "https://git.quineglobal.com/quine-global/quintodrome.git"

  # The app updates itself (Sparkle), so `brew upgrade` leaves it
  # be unless asked with --greedy.
  auto_updates true
  depends_on :macos

  app "Quintodrome.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Quintodrome.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.quineglobal.drome",
    "~/Library/Application Support/com.quintodrome.desktop",
  ]
end
