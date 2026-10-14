# Homebrew tap for voice-to-text

[voice-to-text](https://github.com/powell-clark/voice-to-text) is free, offline
push-to-talk transcription: hold a key, speak, and the text types into the app
you are in. This tap installs it on macOS (Apple Silicon and Intel).

## Install

```bash
brew install powell-clark/voice-to-text/voice-to-text
```

The full name taps this repository and trusts only this formula, as Homebrew's
[tap trust](https://docs.brew.sh/Tap-Trust) asks; `brew tap` followed by a
bare `brew install voice-to-text` is refused for an untrusted tap.

The formula builds from source with Rust and CMake, with Metal GPU
acceleration, so the first install takes a few minutes. Homebrew installs the
build tools it needs; the Xcode Command Line Tools must be present
(`xcode-select --install`).

Check the install with `vtt --version`.

## Run

Start the menu-bar app from a terminal:

```bash
vtt
```

## Permissions

On first run macOS asks for **Microphone**, **Accessibility** and
**Input Monitoring** access. Allow each in System Settings → Privacy & Security
for the app the prompt names (your terminal app when `vtt` starts from a
shell), then quit and start `vtt` again.

## Update and remove

```bash
brew upgrade voice-to-text
brew uninstall voice-to-text && brew untap powell-clark/voice-to-text
```

Linux (apt PPA) and Windows (`.msi`) installs are covered in the main
[README](https://github.com/powell-clark/voice-to-text#install).

## Licence

Apache License 2.0 — see [LICENSE](LICENSE).
