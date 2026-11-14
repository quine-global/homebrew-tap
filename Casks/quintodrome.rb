cask "quintodrome" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.0.0-alpha.15"
  sha256 arm:   "8024125137bc30bfbfab5d6bfbd3f760c455fe40bf5b3611b522f8b92508abcb",
         intel: "c902770eba664b31f32d1894a23730ad5388b3dcb42546791a53d77ad982cd0f"

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
