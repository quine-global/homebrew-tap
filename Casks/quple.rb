cask "quple" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.0"
  sha256 arm:   "d3dda404f93a1c7b5f798b636b269c1f8b46872f174a5d1b5cff5095f5fb598e",
         intel: "3714a7e1c47634a620cddd990a234ab44465215ceea5b76aad1d3c3062c0891c"

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
