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

  def caveats
    <<~EOS
      Add the following to the end of your ~/.bashrc, ~/.zshrc, or ~/.config/fish/config.fish file:

      Bash:
        eval "$(mcfly init bash)"
        eval "$(mcfly-fzf init bash)"

      Zsh:
        eval "$(mcfly init zsh)"
        eval "$(mcfly-fzf init zsh)"

      Fish:
        mcfly init fish | source
        mcfly-fzf init fish | source
    EOS
  end

  test do
    assert shell_output("#{bin}/mcfly-fzf --version")
  end
end
