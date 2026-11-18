cask "quple" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.2"
  sha256 arm:   "22e21ee6a735c91de4adc9b1c57b205fba906f1a3fab7f4f50e8df84fa315324",
         intel: "94dda427c7d3a42758554a8859b3ed85ab1dbaf21102818a8d1a2f48fb387b51"

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
