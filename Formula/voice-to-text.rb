class VoiceToText < Formula
  desc "Offline push-to-talk voice transcription with Whisper and Parakeet"
  homepage "https://github.com/powell-clark/voice-to-text"
  # A Git checkout, not a release tarball: GitHub's archives leave out the
  # third_party/whisper.cpp and third_party/SPIRV-Headers submodules, and
  # Homebrew's Git download runs `git submodule update --init --recursive`.
  url "https://github.com/powell-clark/voice-to-text.git",
      tag:      "v2.5.2",
      # The tag's COMMIT SHA: the peeled `refs/tags/v2.5.2^{}` line of
      # `git ls-remote`, not the annotated tag object.
      revision: "8544abaa7fea25612c0329edb79fb7e943b40797"
  license "Apache-2.0"
  head "https://github.com/powell-clark/voice-to-text.git", branch: "main"

  depends_on "cmake" => :build
  depends_on "pkgconf" => :build
  depends_on "rust" => :build
  # Linux installs come from the apt PPA (ppa:powellclark/voice-to-text).
  depends_on :macos

  deny_network_access!

  def fetch
    system "cargo", "fetch", *std_cargo_fetch_args
  end

  def install
    # Metal needs no flag: Cargo.toml's macOS target block enables whisper-rs's
    # `metal` feature, and whisper.cpp embeds its Metal library in the binary.
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      voice-to-text is a menu-bar app. Start it from a terminal:
        vtt

      On first run macOS asks for Microphone, Accessibility and Input Monitoring
      access. Allow each in System Settings > Privacy & Security for the app the
      prompt names (your terminal app when vtt starts from a shell), then quit
      and start vtt again.

      Hold Scroll Lock (the default hotkey), speak, and release: the text types
      into the focused app. A keyboard without Scroll Lock can set another key
      with a hotkey= line in
        ~/Library/Application Support/voice-to-text/settings.conf
      The speech model downloads on first use into
        ~/Library/Caches/voice-to-text/models

      Start at login is not available on macOS yet.
    EOS
  end

  test do
    output = shell_output("#{bin}/vtt --version")
    assert_match "voice-to-text #{version}", output unless version.head?
    assert_match "whisper.cpp", output
  end
end
