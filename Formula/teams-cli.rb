class TeamsCli < Formula
  desc "Control Microsoft Teams calls through macOS Accessibility"
  homepage "https://github.com/dzanotto/teams-cli"

  license "MIT"

  bottle do
    root_url "https://github.com/dzanotto/homebrew-tap/releases/download/teams-cli-0.1.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe: "9372f1417ac899b49602e800f0f5f221ba8e152a929986a0af2cfec7e5384f86"
  end

  if Hardware::CPU.arm?
    url "https://github.com/dzanotto/teams-cli/releases/download/v0.1.3/teams-cli-v0.1.3-macos-arm64.tar.gz"
    sha256 "e3407fa370e11b8f4ad1d10cd3ef373854bc259ea62bb9a2b0987175807b59b3"
  else
    url "https://github.com/dzanotto/teams-cli/releases/download/v0.1.3/teams-cli-v0.1.3-macos-x86_64.tar.gz"
    sha256 "cd743e5df9ae9c39045a49d566e97cdd1953af4eba3c87c002b4814604f1bda8"
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
