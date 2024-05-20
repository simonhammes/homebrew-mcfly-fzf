# typed: true
# frozen_string_literal: true

# Formula for mcfly-fzf
class McflyFzf < Formula
  desc "Integrate McFly with fzf"
  homepage "https://github.com/bnprks/mcfly-fzf"
  url "https://github.com/bnprks/mcfly-fzf/archive/refs/tags/0.1.3.tar.gz"
  sha256 "e5d9f5ed56889c8f27d4526b2570d41d8a368d17a9f5d94d2876956b1e1cf430"
  license "MIT"

  bottle do
    root_url "https://github.com/simonhammes/homebrew-mcfly-fzf/releases/download/mcfly-fzf-0.1.3"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "799d2b2352c8300a26c8cced24162c79c57b126ae6ae24c5636a38900392813c"
  end

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
