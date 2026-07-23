cask "veritas-kanban" do
  version "5.2.5"
  sha256 "3f1816de7ae46d5e0541209f8acd65ffa32a47bd5caeedd9546358557e66fced"

  url "https://github.com/BradGroux/veritas-kanban/releases/download/v#{version}/Veritas-Kanban-#{version}-mac-arm64.zip"
  name "Veritas Kanban"
  desc "Local-first task management and AI agent orchestration"
  homepage "https://github.com/BradGroux/veritas-kanban"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "veritas-kanban.app", target: "Veritas Kanban.app"

  caveats <<~EOS
    Homebrew installs or replaces the app but does not launch it or wait for its
    bundled server. Start Veritas Kanban with:
      open -a "Veritas Kanban"

    macOS can return from that command before port 3001 is ready. Use the
    bounded, exact-version readiness check in the upgrade guide instead of one
    immediate curl:
      https://github.com/BradGroux/veritas-kanban/blob/main/docs/V5-UPGRADE-INSTALL-ADMIN-GUIDE.md#routine-mac-desktop-upgrade

    For web/source-to-desktop migration and competing-server cleanup:
      https://github.com/BradGroux/veritas-kanban/blob/main/docs/WEB-TO-MAC-DESKTOP-MIGRATION.md
  EOS

  zap trash: [
    "~/Library/Application Support/@veritas-kanban",
    "~/Library/Preferences/io.digitalmeld.veritas-kanban.plist",
  ]
end
