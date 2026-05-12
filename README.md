# BradGroux Homebrew Tap

Homebrew tap for Digital Meld and BradGroux macOS tools.

## Install dm-annotate

```sh
brew tap BradGroux/tap
brew install --cask dm-annotate
```

`dm-annotate` / Digital Meld Annotate is a native, local-only macOS screen annotation tool.

## Uninstall

```sh
brew uninstall --cask dm-annotate
```

Remove app preferences too:

```sh
brew uninstall --cask --zap dm-annotate
```

## Developer Preview Gatekeeper Step

Current `dm-annotate` release downloads are ad-hoc signed and not notarized. macOS Gatekeeper may block them with an "Apple could not verify" dialog until Developer ID signing is configured.

After Homebrew installs the app, run this if macOS blocks first launch:

```sh
xattr -dr com.apple.quarantine "/Applications/Digital Meld Annotate.app"
open "/Applications/Digital Meld Annotate.app"
```

Only do this for builds you trust.

## Maintainer Notes

After publishing a new `dm-annotate` GitHub Release:

1. Update `Casks/dm-annotate.rb` with the new version.
2. Verify the release zip SHA256:

```sh
VERSION="0.1.7"
tmpdir="$(mktemp -d)"
gh release download "v${VERSION}" \
  --repo BradGroux/dm-annotate \
  --pattern "dm-annotate-${VERSION}-macos.zip" \
  --dir "${tmpdir}"
shasum -a 256 "${tmpdir}/dm-annotate-${VERSION}-macos.zip"
rm -rf "${tmpdir}"
```

3. Validate the cask:

```sh
export HOMEBREW_GITHUB_API_TOKEN="$(gh auth token)"
brew audit --cask --strict --online dm-annotate
brew install --cask --dry-run dm-annotate
```
