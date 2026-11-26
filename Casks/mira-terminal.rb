# Homebrew cask for Mira Terminal. It lives in the tap repository mira-foundry/homebrew-tap (Casks/mira-terminal.rb),
# so that `brew install --cask mira-foundry/tap/mira-terminal` works. Update `version` and both `sha256` after each
# release : shasum -a 256 Mira-Terminal-macos-arm64.dmg Mira-Terminal-macos-x64.dmg
cask "mira-terminal" do
  arch arm: "arm64", intel: "x64"

  version "0.1.3"
  sha256 arm:   "9734320b2586da10421744fe80e7e106228cba99e7f91b83008024f9e65e613b",
         intel: "9303bf19e164ede1ee86ffb7c9abb8769e16b5ec131af4ad32be4afbe68ed69f"

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
