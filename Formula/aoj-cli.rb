class AojCli < Formula
  desc "Command-line interface for Aizu Online Judge (AOJ)"
  homepage "https://github.com/YuminosukeSato/AOJ-cli"
  url "https://github.com/YuminosukeSato/AOJ-cli/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
  license "MIT"
  head "https://github.com/YuminosukeSato/AOJ-cli.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"aoj", ldflags: "-s -w"), "./cmd/aojcli"
  end

  test do
    # Test the binary exists and runs
    assert_match "AOJ CLI", shell_output("#{bin}/aoj --help")

    # Test basic functionality without requiring network
    assert_match "Usage:", shell_output("#{bin}/aoj --help")
  end
end
