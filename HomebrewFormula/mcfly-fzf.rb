class McflyFzf < Formula
  desc "Integrate McFly with fzf"
  homepage "https://github.com/bnprks/mcfly-fzf"
  url "https://github.com/bnprks/mcfly-fzf/archive/refs/tags/0.1.1.tar.gz"
  sha256 "6074ed3d84d90f43ad1def5be1313275d4220c14f70de54c2bf706ae16b73a9f"
  license "MIT"

  depends_on "rust" => :build
  depends_on "fzf"
  depends_on "mcfly"

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert shell_output("#{bin}/mcfly-fzf --version")
  end
end
