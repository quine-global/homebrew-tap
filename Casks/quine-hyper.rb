cask "quine-hyper" do
  arch arm: "arm64", intel: "x64"
  linux_arch = on_arch_conditional arm: "arm64", intel: "x86_64"
  asset = on_system_conditional macos: "mac-#{arch}.dmg", linux: "#{linux_arch}.AppImage"

  version "4.0.0-q-canary.18"
  sha256 arm:          "5f71c5e62fd247d3f076db5bf281c30db0943c90f3c5be91d9bae8e4e974d0c9",
         intel:        "72082d1d2f50c084214296e7fdf3135b153a7387da89ce2e70dc95ea154ca21b",
         arm64_linux:  "e2324ce4e5d7437507200f7b8757b27fcb1f04d6274e053e4c56d3570ff1b529",
         x86_64_linux: "91a267047be4ac39dee12600a9d811ffbc955a94eb2bb78e0d9c4cab2ada4d4f"

  on_macos do
    conflicts_with cask: ["hyper", "hyper@canary"]

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
  on_linux do
    app_image "Hyper-#{version}-#{linux_arch}.AppImage"

    zap trash: "~/.config/Hyper"
  end

  url "https://github.com/quine-global/hyper/releases/download/v#{version}/Hyper-#{version}-#{asset}"
  name "Hyper"
  desc "Terminal built on web technologies (Quine fork)"
  homepage "https://github.com/quine-global/hyper"
end
