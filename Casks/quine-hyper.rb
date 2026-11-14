cask "quine-hyper" do
  arch arm: "arm64", intel: "x64"
  asset = on_system_conditional macos: "mac-#{arch}.dmg", linux: "x86_64.AppImage"

  version "4.0.0-q-canary.22"
  sha256 arm:          "a136e844b369a741f99f38985cb6042bc73e3ec47fc39bde386287e74b31c518",
         intel:        "1fbf58b6c90a2dc6f779eeb707e5ea22a2fd92636de14d4b7cca14898485b024",
         x86_64_linux: "22481fb29920a71f2039d65e5f2a0bcd0b1a920cba4adc9f23402c2e335e377a"

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
