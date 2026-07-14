cask "dm-annotate" do
  version "0.1.13"
  sha256 "0f60a6e78ba14096e6d9a9dff736c62d88f16106de32eb528d05c0a34ec1b41a"

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
