cask "veritas-kanban" do
  version "5.0.1"
  sha256 "5501e46377fe9c3e00fdca99f65e2f10ff31a94bcdee5cfaedb8b23a9a1f9fd2"

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

  zap trash: [
    "~/Library/Application Support/@veritas-kanban",
    "~/Library/Preferences/io.digitalmeld.veritas-kanban.plist",
  ]
end
