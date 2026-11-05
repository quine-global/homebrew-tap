cask "quintodrome" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.0.0-alpha.9"
  sha256 arm:   "92dd5bb5be92ff7e227ca3892e1c800d103ad002b949d6b5cf6c03777074ab19",
         intel: "1e35c43dcb33558c0fa16e2ec1754d70f0adc5ea2c66833f533fb2bf261e5fe2"

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
