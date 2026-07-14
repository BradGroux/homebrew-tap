cask "dm-annotate" do
  version "0.1.12"
  sha256 "91e2f8b03f8950694bf72d4cf9b3c6988332446e4c5ab39b6677050f358ca7b4"

  url "https://github.com/BradGroux/dm-annotate/releases/download/v#{version}/dm-annotate-#{version}-macos.zip"
  name "Digital Meld Annotate"
  desc "Native, local-only screen annotation tool"
  homepage "https://github.com/BradGroux/dm-annotate"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Digital Meld Annotate.app"

  zap trash: "~/Library/Preferences/io.digitalmeld.dm-annotate.plist"
end
