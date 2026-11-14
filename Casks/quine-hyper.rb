cask "quine-hyper" do
  arch arm: "arm64", intel: "x64"
  asset = on_system_conditional macos: "mac-#{arch}.dmg", linux: "x86_64.AppImage"

  version "4.0.0-q-canary.20"
  sha256 arm:          "5a732a01ab569029efd488d2345bf6bdc02ccc8f841f64f78ae45cd0ce761b1f",
         intel:        "61937afbc938c827e02345c84fa8a201c243f5d922eadba581851c67331a4157",
         x86_64_linux: "87dfacb80888c379c635ca7c0f94d08f2a91ca6a78c83d89331b429f204a8aff"

  on_macos do
    auto_updates true # Sparkle; `brew upgrade --greedy` still upgrades it
    conflicts_with cask: ["hyper", "hyper@canary"]

    app "Hyper.app"
    binary "#{appdir}/Hyper.app/Contents/Resources/bin/hyper"

    # Only ad-hoc signed: without this, Gatekeeper refuses to open it.
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
    depends_on arch: :x86_64

    app_image "Hyper-#{version}-x86_64.AppImage"

    zap trash: "~/.config/Hyper"
  end

  url "https://github.com/quine-global/hyper/releases/download/v#{version}/Hyper-#{version}-#{asset}"
  name "Hyper"
  desc "Terminal built on web technologies (Quine fork)"
  homepage "https://github.com/quine-global/hyper"
end
