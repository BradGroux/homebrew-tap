# frozen_string_literal: true

cask "veritas-kanban" do
  version "6.1.6"
  sha256 "d92a8b7449152434032301d4e9b7602085a73868f964aee54d81960444c7b70a"

  url "https://github.com/BradGroux/veritas-kanban/releases/download/v#{version}/Veritas-Kanban-#{version}-mac-arm64.zip"
  name "Veritas Kanban"
  desc "Local-first task management and AI agent orchestration"
  homepage "https://github.com/BradGroux/veritas-kanban"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "veritas-kanban.app", target: "Veritas Kanban.app"

  zap trash: [
    "~/Library/Application Support/@veritas-kanban",
    "~/Library/Preferences/io.digitalmeld.veritas-kanban.plist",
  ]

  caveats <<~EOS
    Homebrew installs or replaces the app but does not launch it or wait for its
    bundled server. Start Veritas Kanban with:
      open -a "Veritas Kanban"

    macOS can return from that command before port 3001 is ready. Use the
    bounded exact-version and packaged-listener check in the upgrade guide
    instead of one immediate curl:
      https://github.com/BradGroux/veritas-kanban/blob/main/docs/V6-UPGRADE-INSTALL-ADMIN-GUIDE.md#routine-mac-desktop-upgrade

    For web/source-to-desktop migration and competing-server cleanup:
      https://github.com/BradGroux/veritas-kanban/blob/main/docs/WEB-TO-MAC-DESKTOP-MIGRATION.md
  EOS
end
