class TeamsCli < Formula
  desc "Control Microsoft Teams calls through macOS Accessibility"
  homepage "https://github.com/dzanotto/teams-cli"
  version "0.1.1"
  license "MIT"

  depends_on macos: :ventura

  on_arm do
    url "https://github.com/dzanotto/teams-cli/releases/download/v#{version}/teams-cli-v#{version}-macos-arm64.tar.gz"
    sha256 "20f89c71c4118e9b0c02f186f6451d0de4062958253905441a411e8ae2ab4e26"
  end

  on_intel do
    url "https://github.com/dzanotto/teams-cli/releases/download/v#{version}/teams-cli-v#{version}-macos-x86_64.tar.gz"
    sha256 "e49b1bd550d85ad4e733ea9f0c0fb38b26ba9d8b982df31e5a70bbb29896c453"
  end

  def install
    bin.install "teams-cli"
  end

  def caveats
    <<~EOS
      Teams CLI requires Accessibility permission for your terminal or launcher.

      Enable access in:
        System Settings → Privacy & Security → Accessibility

      If macOS requests permission for the executable itself, authorize:
        #{opt_bin}/teams-cli

      Microsoft Teams must be running for call controls to work.
    EOS
  end

  test do
    assert_match "teams-cli", shell_output("#{bin}/teams-cli --help")
  end
end