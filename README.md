# SimStore Homebrew Tap

Install [SimStore](https://github.com/iSimStore/simstore), a macOS app for discovering and managing prebuilt open-source iOS Simulator apps. Requires an Apple Silicon Mac running macOS 14 or later, with Xcode and an iOS Simulator runtime installed.

## Install

```sh
brew install --cask isimstore/tap/simstore
```

SimStore installs to `~/Applications/SimStore.app`. The installation hook automatically removes the download quarantine attribute from the bundle and its contents.

## Upgrade

```sh
brew update
brew upgrade --cask simstore
```

## Uninstall

```sh
brew uninstall --cask simstore
```

To also remove SimStore preferences and caches:

```sh
brew uninstall --cask --zap simstore
```

## Maintain

Update `version` and `sha256` in `Casks/simstore.rb` after publishing a stable [SimStore release](https://github.com/iSimStore/simstore/releases). Use the archive checksum from that release's `release.json`. The livecheck configuration checks stable GitHub releases.

## License

This tap is licensed under the [MIT License](LICENSE).
