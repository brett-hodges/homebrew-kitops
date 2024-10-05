class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url 
      sha256 
    end
    on_intel do
      url 
      sha256 
    end

  end

  on_linux do
    on_arm do
      url "https://github.com/brett-hodges/kitops/releases/download/v5.0.1/kitops-linux-arm64.tar.gz"
      sha256 "eb92bb276e7f6306529b12a87596c3f48be326f743ff535fdc641d53a3d2b653"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/brett-hodges/kitops/releases/download/v5.0.1/kitops-linux-x86_64.tar.gz"
        sha256 "c96adf52709106127fda6df8de96ad72d62a74a8063da417725829225ba7fd45"
      else
        url "https://github.com/brett-hodges/kitops/releases/download/v5.0.1/kitops-linux-i386.tar.gz"
        sha256 "afcf6b0add91f42235b57ba86768f2aa1278c3e2075060ddfba67dce9ff027e6"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: "
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
