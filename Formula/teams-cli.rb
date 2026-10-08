class TeamsCli < Formula
  desc "Control Microsoft Teams calls through macOS Accessibility"
  homepage "https://github.com/dzanotto/teams-cli"

  license "MIT"

  if Hardware::CPU.arm?
    url "https://github.com/dzanotto/teams-cli/releases/download/v0.1.2/teams-cli-v0.1.2-macos-arm64.tar.gz"
    sha256 "c33944308426ec130c31eef84a755bbca2d33fb48418669b7d11e2e85940f332"
  else
    url "https://github.com/dzanotto/teams-cli/releases/download/v0.1.2/teams-cli-v0.1.2-macos-x86_64.tar.gz"
    sha256 "34d8329c52600aaddf22af6eb138df91f4e594786520d1020d8ee92538e427ae"
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
