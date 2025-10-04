class AojCli < Formula
  desc "CLI tool for Aizu Online Judge with init and submit commands"
  homepage "https://github.com/YuminosukeSato/AOJ-cli"
  url "https://github.com/YuminosukeSato/AOJ-cli/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "55e5b38010667dea8dca45e1d68d12102d0c7d41a8e38918f419509dd2f43873"
  license "MIT"
  head "https://github.com/YuminosukeSato/AOJ-cli.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"aoj", ldflags: "-s -w"), "./cmd/aojcli"
  end

  test do
    # Test the binary exists and runs
    assert_match "AOJ CLI", shell_output("#{bin}/aoj --help")

    # Test init command is available
    assert_match "init", shell_output("#{bin}/aoj --help")

    # Test submit command is available
    assert_match "submit", shell_output("#{bin}/aoj --help")
  end
end
