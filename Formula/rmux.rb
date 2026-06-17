# typed: strict
# frozen_string_literal: true

# Do not edit by hand; regenerate from the RMUX GitHub Release SHA256SUMS.
class Rmux < Formula
  desc "Local terminal multiplexer with a tmux-style CLI and daemon runtime"
  homepage "https://rmux.io"
  version "0.6.1"
  url "https://github.com/Helvesec/rmux/releases/download/v0.6.1/rmux-0.6.1-macos-aarch64.tar.gz"
  sha256 "098865b968a12d87fe5d25d877e69dfa77d4452b1776e8dd54c334e4152cc1e0"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/Helvesec/rmux/releases/download/v0.6.1/rmux-0.6.1-macos-aarch64.tar.gz"
      sha256 "098865b968a12d87fe5d25d877e69dfa77d4452b1776e8dd54c334e4152cc1e0"
    end

    on_intel do
      url "https://github.com/Helvesec/rmux/releases/download/v0.6.1/rmux-0.6.1-macos-x86_64.tar.gz"
      sha256 "09dc8baceb900bbd161d7841d2436e08a643afe0734113402a8fa8d7f6466f33"
    end
  end

  def install
    bin.install "bin/rmux"
    bin.install "bin/rmux-daemon" if File.exist?("bin/rmux-daemon")
    man1.install "share/man/man1/rmux.1"
    bash_completion.install "share/bash-completion/completions/rmux" if File.exist?("share/bash-completion/completions/rmux")
    zsh_completion.install "share/zsh/site-functions/_rmux" if File.exist?("share/zsh/site-functions/_rmux")
    fish_completion.install "share/fish/vendor_completions.d/rmux.fish" if File.exist?("share/fish/vendor_completions.d/rmux.fish")
    pkgshare.install "share/rmux/artifact-metadata.json" if File.exist?("share/rmux/artifact-metadata.json")

    license_files = Dir["LICENSE*"]
    prefix.install license_files unless license_files.empty?
  end

  test do
    assert_match "rmux #{version}", shell_output("#{bin}/rmux -V")
  end
end
