class TeamsCli < Formula
  desc "Control Microsoft Teams calls through macOS Accessibility"
  homepage "https://github.com/dzanotto/teams-cli"

  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/dzanotto/teams-cli/releases/download/v0.1.5/teams-cli-v0.1.5-macos-arm64.tar.gz"
    sha256 "1f12c021b5a46d81854d5423dedd712be45a969c58da6b8f9e8f98ee271ca077"
  else
    url "https://github.com/dzanotto/teams-cli/releases/download/v0.1.5/teams-cli-v0.1.5-macos-x86_64.tar.gz"
    sha256 "b3483b11fbd4aecb146d049290b30704d2ee133e1783ceaa29ae4a29b00bdcb7"
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
