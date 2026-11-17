cask "quple" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.1.1"
  sha256 arm:   "92dea7569ae90d66a11d75b40e76cae0306afff9b214d9b94669fb23a5a1e928",
         intel: "edec92b6ac08b5189bb61f8932a0dbe2dcfc0ada27e41385297e6af619b82caa"

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
