cask "veritas-kanban" do
  version "5.0.0"
  sha256 "ea492c71c3276de8c44c15e1ccb51fc7d713b5b4f8b8c9f302c0f5dd54e14c32"

  url "https://github.com/BradGroux/veritas-kanban/releases/download/v#{version}/Veritas-Kanban-#{version}-mac-arm64.zip",
      verified: "github.com/BradGroux/veritas-kanban/"
  name "Veritas Kanban"
  desc "Local-first task management and AI agent orchestration"
  homepage "https://github.com/BradGroux/veritas-kanban"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Veritas Kanban.app"

  zap trash: [
    "~/Library/Application Support/@veritas-kanban",
    "~/Library/Preferences/io.digitalmeld.veritas-kanban.plist",
  ]
end
