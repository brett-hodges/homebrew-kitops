class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/brett-hodges/kitops/releases/download/0..4.2/kitops-darwin-arm64.tar.gz"
      sha256 "e4df5ccf2750c463e157d47d4ba7042126826458b3fee9f3f7f33992fce5b5ea"
    end
    on_intel do
      url "https://github.com/brett-hodges/kitops/releases/download/0..4.2/kitops-darwin-x86_64.tar.gz"
      sha256 "92aed0f10f260e37a0e88912b65991a91399b8562dbc65049dd61ec49bde50b9"
    end

  end

  on_linux do
    on_arm do
      url "https://github.com/brett-hodges/kitops/releases/download/0..4.2/kitops-linux-arm64.tar.gz"
      sha256 "776b96cc8a8b3d9cbea8d129d874ddde8850a2ec32ea80d9cfddd4fd53cd0e6e"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/brett-hodges/kitops/releases/download/0..4.2/kitops-linux-x86_64.tar.gz"
        sha256 "665b707caa393c192c154cb2746a6313aad98732ed9eb1f4d19a0ade1b4440df"
      else
        url "https://github.com/brett-hodges/kitops/releases/download/0..4.2/kitops-linux-i386.tar.gz"
        sha256 "8f9e1af6c694571cfeb7a1378622d5f5fc6b0082014561a672bed44976293dc9"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 0..4.2"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
