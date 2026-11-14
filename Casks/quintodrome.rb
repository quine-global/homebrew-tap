cask "quintodrome" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.0.0-alpha.18"
  sha256 arm:   "53498d62180eecd97c39fe20136b53339487e28a32a4f87586eeddfb3a30a931",
         intel: "2972aa196f88fe62396a9c5acbe69915193be053f3ce6434882cd9b2ab5fcc4f"

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
