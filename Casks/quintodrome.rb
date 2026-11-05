cask "quintodrome" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.0.0-alpha.14"
  sha256 arm:   "d0b69f8a25fade9183520c0958e7a7b6ca0f972bf8b77ae3384119f65548d898",
         intel: "7bdd6d5e9a10aa5f846603012f4afe0acefba49e1ef970a96af38e8c83eea92b"

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
