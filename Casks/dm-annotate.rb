cask "dm-annotate" do
  version "0.1.11"
  sha256 "4553d332b3d011071c41e1728c5cdd69d943f8507fcb81e2593749b74791d8bf"

  url "https://github.com/BradGroux/dm-annotate/releases/download/v#{version}/dm-annotate-#{version}-macos.zip"
  name "Digital Meld Annotate"
  desc "Native, local-only screen annotation tool"
  homepage "https://github.com/BradGroux/dm-annotate"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "Digital Meld Annotate.app"

  zap trash: "~/Library/Preferences/io.digitalmeld.dm-annotate.plist"
end
