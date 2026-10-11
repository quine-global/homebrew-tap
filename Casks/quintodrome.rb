cask "quintodrome" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.0.0-alpha.8"
  sha256 arm:   "a5fe6f412b5b253bc7bfc8bf78311b843a1553073fb302794cbefcd13f4ca29b",
         intel: "5c33779a1f765d6d5e4292796248d0fe65b9cb0754394b952c85d387c06e8453"

  url "https://forge.quinefoundation.com/quine-global/quintodrome/releases/download/v#{version}/Quintodrome-#{arch}-apple-darwin.app.zip"
  name "Quintodrome"
  desc "Desktop app wrapping the Navidrome music server"
  homepage "https://forge.quinefoundation.com/quine-global/quintodrome"

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
