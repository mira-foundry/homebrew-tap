# Homebrew cask for Mira Terminal. It lives in the tap repository mira-foundry/homebrew-tap (Casks/mira-terminal.rb),
# so that `brew install --cask mira-foundry/tap/mira-terminal` works. Update `version` and both `sha256` after each
# release : shasum -a 256 Mira-Terminal-macos-arm64.dmg Mira-Terminal-macos-x64.dmg
cask "mira-terminal" do
  arch arm: "arm64", intel: "x64"

  version "0.1.0"
  sha256 arm:   "33993b4d4bfa1b3ba362d0a2546f36cdcf2e38977ca283cce3403b65af63b8e0",
         intel: "b95a22dd61b6fed694c9e5faf4b54f6081a4018374863ac3e61b112b5537a30a"

  url "https://github.com/mira-foundry/mira-terminal/releases/download/v#{version}/Mira-Terminal-macos-#{arch}.dmg"
  name "Mira Terminal"
  desc "Terminal for all your projects, agents and tasks"
  homepage "https://github.com/mira-foundry/mira-terminal"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :ventura

  app "Mira Terminal.app"

  zap trash: [
    "~/Library/Application Support/Mira Terminal",
    "~/Library/Preferences/dev.mira.terminal.plist",
    "~/Library/Saved Application State/dev.mira.terminal.savedState",
  ]
end
