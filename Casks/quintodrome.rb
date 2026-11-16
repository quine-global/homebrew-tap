cask "quintodrome" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.0.0-alpha.19"
  sha256 arm:   "e4e334b19573c613d7bf03641912b43147ea8368b3b0d6a4ecc1a5e3954eeefb",
         intel: "c4da850759887e9effc02a275e5cbcd42d5ef2e755749ac175655a6a935c232a"

  url "https://git.quineglobal.com/quine-global/quintodrome/releases/download/v#{version}/Quintodrome-#{arch}-apple-darwin.app.zip"
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
