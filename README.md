# BradGroux Homebrew Tap

Homebrew tap for Digital Meld and BradGroux macOS tools.

## Install

### Veritas Kanban

```sh
brew tap BradGroux/tap
brew install --cask veritas-kanban
```

Veritas Kanban is a local-first task management and AI agent orchestration workspace.

### dm-annotate

```sh
brew tap BradGroux/tap
brew install --cask dm-annotate
```

`dm-annotate` / Digital Meld Annotate is a native, local-only macOS screen annotation tool.

The current v0.1.12 release is Apple silicon only. The cask enforces that requirement so Intel Macs cannot install an incompatible artifact. The restriction will be removed with the next universal release.

If Homebrew reports that `dm-annotate` exists in multiple taps, remove the retired app-repo tap:

```sh
brew reinstall --cask bradgroux/tap/dm-annotate
brew untap --force BradGroux/dm-annotate
brew install --cask dm-annotate
```

### dm-lessonmeld

```sh
brew tap BradGroux/tap
brew install --cask dm-lessonmeld
```

`dm-lessonmeld` / Digital Meld LessonMeld is a native, local-first macOS recording suite for curriculum builders.

## Uninstall

```sh
brew uninstall --cask veritas-kanban
brew uninstall --cask dm-annotate
brew uninstall --cask dm-lessonmeld
```

Remove app preferences too:

```sh
brew uninstall --cask --zap veritas-kanban
brew uninstall --cask --zap dm-annotate
brew uninstall --cask --zap dm-lessonmeld
```

## Gatekeeper Status

Current `veritas-kanban` and `dm-annotate` release downloads are Developer ID signed, notarized, and stapled.

`dm-lessonmeld` release downloads may still be ad-hoc signed. macOS Gatekeeper can block ad-hoc builds with an "Apple could not verify" dialog.

After Homebrew installs an ad-hoc build, run this only if macOS blocks first launch:

```sh
xattr -dr com.apple.quarantine "/Applications/Digital Meld LessonMeld.app"
open "/Applications/Digital Meld LessonMeld.app"
```

Only do this for builds you trust.

## Maintainer Notes

After publishing a new GitHub Release:

1. Update the matching cask with the new version.
2. Verify the release zip SHA256:

```sh
VERSION="0.1.9"
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
brew audit --cask --strict --online bradgroux/tap/dm-annotate
brew install --cask --dry-run bradgroux/tap/dm-annotate
brew audit --cask --strict --online bradgroux/tap/dm-lessonmeld
brew install --cask --dry-run bradgroux/tap/dm-lessonmeld
brew audit --cask --strict --online bradgroux/tap/veritas-kanban
brew install --cask --dry-run bradgroux/tap/veritas-kanban
```
