# Homebrew cask for Mira Terminal. It lives in the tap repository mira-foundry/homebrew-tap (Casks/mira-terminal.rb),
# so that `brew install --cask mira-foundry/tap/mira-terminal` works. Update `version` and both `sha256` after each
# release : shasum -a 256 Mira-Terminal-macos-arm64.dmg Mira-Terminal-macos-x64.dmg
cask "mira-terminal" do
  arch arm: "arm64", intel: "x64"

  version "0.1.1"
  sha256 arm:   "cfe7f1a3f89945ee09e1616f3ba2cfd5adfb17b8f2959b51acf706696a91a151",
         intel: "87454743ef232130389703f2faee965cec5c757b55f2f4c13f91a797611da308"

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
