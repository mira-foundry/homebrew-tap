# Homebrew cask for Mira Terminal. It lives in the tap repository mira-foundry/homebrew-tap (Casks/mira-terminal.rb),
# so that `brew install --cask mira-foundry/tap/mira-terminal` works. Update `version` and both `sha256` after each
# release : shasum -a 256 Mira-Terminal-macos-arm64.dmg Mira-Terminal-macos-x64.dmg
cask "mira-terminal" do
  arch arm: "arm64", intel: "x64"

  version "0.1.2"
  sha256 arm:   "fc80e051921ca58f29c8afaead735dec68c16e3a17acc3cc99e25835346d8ea7",
         intel: "01e9b3325a7a18dca15c53294ea056929f59a6f25d06306c5f41f1ab25ce48de"

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
