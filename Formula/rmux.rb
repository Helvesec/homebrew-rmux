# typed: strict
# frozen_string_literal: true

# Do not edit by hand; regenerate from the RMUX GitHub Release SHA256SUMS.
class Rmux < Formula
  desc "Local terminal multiplexer with a tmux-style CLI and daemon runtime"
  homepage "https://rmux.io"
  version "0.5.0"
  url "https://github.com/Helvesec/rmux/releases/download/v0.5.0/rmux-0.5.0-macos-aarch64.tar.gz"
  sha256 "283d1e3458daeb2168a2b9f760c200f3188eba38fb8c08977fd0c29c18410afc"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/Helvesec/rmux/releases/download/v0.5.0/rmux-0.5.0-macos-aarch64.tar.gz"
      sha256 "283d1e3458daeb2168a2b9f760c200f3188eba38fb8c08977fd0c29c18410afc"
    end

    on_intel do
      url "https://github.com/Helvesec/rmux/releases/download/v0.5.0/rmux-0.5.0-macos-x86_64.tar.gz"
      sha256 "5c3228994849d12e13551eb016327bd37c70949b9b00e42bcd27dfdbd1a53400"
    end
  end

  def install
    bin.install "bin/rmux"
    man1.install "share/man/man1/rmux.1"
    pkgshare.install "share/rmux/artifact-metadata.json" if File.exist?("share/rmux/artifact-metadata.json")

    license_files = Dir["LICENSE*"]
    prefix.install license_files unless license_files.empty?
  end

  test do
    assert_match "rmux #{version}", shell_output("#{bin}/rmux -V")
  end
end
