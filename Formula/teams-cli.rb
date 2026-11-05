class TeamsCli < Formula
  desc "Control Microsoft Teams calls through macOS Accessibility"
  homepage "https://github.com/dzanotto/teams-cli"

  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/dzanotto/teams-cli/releases/download/v0.1.4/teams-cli-v0.1.4-macos-arm64.tar.gz"
    sha256 "96d207d31a11a3d322545eec3dd83bc15f4f72d1cec2eb4fb2b1ba728e903a15"
  else
    url "https://github.com/dzanotto/teams-cli/releases/download/v0.1.4/teams-cli-v0.1.4-macos-x86_64.tar.gz"
    sha256 "e084523170d6a862a51e956bab1b28b21a050589413e84c0ac16edb9d4d904f0"
  end

  depends_on macos: :ventura

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
