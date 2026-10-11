cask "quine-hyper" do
  arch arm: "arm64", intel: "x64"

  version "4.0.0-q-canary.18"
  sha256 arm:   "5f71c5e62fd247d3f076db5bf281c30db0943c90f3c5be91d9bae8e4e974d0c9",
         intel: "72082d1d2f50c084214296e7fdf3135b153a7387da89ce2e70dc95ea154ca21b"

  url "https://github.com/quine-global/hyper/releases/download/v#{version}/Hyper-#{version}-mac-#{arch}.dmg"
  name "Hyper"
  desc "Terminal built on web technologies (Quine fork)"
  homepage "https://github.com/quine-global/hyper"

  conflicts_with cask: ["hyper", "hyper@canary"]
  depends_on :macos

  app "Hyper.app"
  binary "#{appdir}/Hyper.app/Contents/Resources/bin/hyper"

  # Only ad-hoc signed: strip the quarantine flag Homebrew adds, or
  # Gatekeeper refuses to open it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Hyper.app"]
  end

  zap trash: [
    "~/.config/Hyper",
    "~/Library/Application Support/Hyper",
    "~/Library/Caches/com.quineglobal.hyper",
    "~/Library/Caches/com.quineglobal.hyper.ShipIt",
    "~/Library/Logs/Hyper",
    "~/Library/Preferences/com.quineglobal.hyper.plist",
    "~/Library/Saved Application State/com.quineglobal.hyper.savedState",
  ]
end
