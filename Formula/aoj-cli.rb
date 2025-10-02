class AojCli < Formula
  desc "Command-line interface for Aizu Online Judge (AOJ)"
  homepage "https://github.com/YuminosukeSato/AOJ-cli"
  url "https://github.com/YuminosukeSato/AOJ-cli/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "178ad9c7842f1fd6b8c9dd820f4cafb3bafbc4b1ad68b94fab7fa00da8223403"
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
