# typed: strict
# frozen_string_literal: true

# Do not edit by hand; regenerate from the RMUX GitHub Release SHA256SUMS.
class Rmux < Formula
  desc "Local terminal multiplexer with a tmux-style CLI and daemon runtime"
  homepage "https://rmux.io"
  version "0.8.0"
  url "https://github.com/Helvesec/rmux/releases/download/v0.8.0/rmux-0.8.0-macos-aarch64.tar.gz"
  sha256 "2b77928bcbe30f0f30cb58c954eaedecb34d9b2341c75ce56a4b0b680f31b6e4"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/Helvesec/rmux/releases/download/v0.8.0/rmux-0.8.0-macos-aarch64.tar.gz"
      sha256 "2b77928bcbe30f0f30cb58c954eaedecb34d9b2341c75ce56a4b0b680f31b6e4"
    end

    on_intel do
      url "https://github.com/Helvesec/rmux/releases/download/v0.8.0/rmux-0.8.0-macos-x86_64.tar.gz"
      sha256 "d64b1cfd972a67e7bb1ccce4e28da4564f43c2b5a6838b6da691363f7a37d668"
    end
  end

  def install
    bin.install "bin/rmux"
    bin.install "bin/rmux-daemon" if File.exist?("bin/rmux-daemon")
    libexec.install "libexec/rmux" if File.exist?("libexec/rmux")
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
