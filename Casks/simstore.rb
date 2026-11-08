cask "simstore" do
  version "1.0.0"
  sha256 "ba26cb28dc027af16973dcfdd5b71ae90b4fa95e46e52bd0508dfadfb67eb037"

  url "https://github.com/iSimStore/simstore/releases/download/#{version}/SimStore.app.tar.bz2"
  name "SimStore"
  desc "Discover and manage open-source iOS Simulator apps"
  homepage "https://github.com/iSimStore/simstore"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "SimStore.app", target: "~/Applications/SimStore.app"

  postflight_steps do
    # Homebrew links the staged app to its installed target after moving it.
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{staged_path}}/SimStore.app/"],
        writable_paths: ["Applications/SimStore.app"],
        writable_base:  :home
  end

  uninstall quit: "io.simstore.SimStore"

  zap trash: [
    "~/Library/Application Support/io.simstore.SimStore",
    "~/Library/Caches/io.simstore.SimStore",
    "~/Library/HTTPStorages/io.simstore.SimStore",
    "~/Library/HTTPStorages/io.simstore.SimStore.binarycookies",
    "~/Library/Logs/io.simstore.SimStore",
    "~/Library/Preferences/ByHost/io.simstore.SimStore.*.plist",
    "~/Library/Preferences/io.simstore.SimStore.plist",
    "~/Library/Saved Application State/io.simstore.SimStore.savedState",
    "~/Library/WebKit/io.simstore.SimStore",
  ]

  caveats <<~EOS
    Requires Xcode with an iOS Simulator runtime.
  EOS
end
