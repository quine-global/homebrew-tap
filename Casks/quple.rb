cask "quple" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.3"
  sha256 arm:   "0e818f758cc98373e9a672f5ff8558ae572fd67a579f9c2dd169f7586ad21484",
         intel: "65998a4cae62af4bc6348139a2ca953ac9773c3f30d3d2b2faa3798e9b33276b"

  url "https://git.quineglobal.com/quine-global/quple/releases/download/v#{version}/Quple-#{arch}-apple-darwin.app.zip"
  name "Quple"
  desc "Call other Quine users over Jitsi Meet"
  homepage "https://git.quineglobal.com/quine-global/quple.git"

  # The app updates itself (Sparkle), so `brew upgrade` leaves it
  # be unless asked with --greedy.
  auto_updates true
  depends_on :macos

  app "Quple.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Quple.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.quple.desktop",
  ]
end
