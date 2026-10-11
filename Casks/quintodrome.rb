cask "quintodrome" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.0.0-alpha.7"
  sha256 arm:   "38de2a7d2610ab66e374d89e7eba93393bbb7d615ad028eaf558d4d41d2e8e98",
         intel: "c80796ae91192d90de189cf6d6eef704f0f0e36645e242523cb2e36775c3ba06"

  url "https://forge.quinefoundation.com/quine-global/quintodrome/releases/download/v#{version}/Quintodrome-#{arch}-apple-darwin.app.zip"
  name "Quintodrome"
  desc "Desktop app wrapping the Navidrome music server"
  homepage "https://forge.quinefoundation.com/quine-global/quintodrome"

  app "Quintodrome.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Quintodrome.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.quineglobal.drome",
    "~/Library/Application Support/com.quintodrome.desktop",
  ]
end
