class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/brett-hodges/kitops/releases/download/v0.4.7/kitops-darwin-arm64.tar.gz"
      sha256 "e9484de5ff710f4553396776dd6ef397215e53c2f23e363a7f5b33eda3dee1fe"
    end
    on_intel do
      url "https://github.com/brett-hodges/kitops/releases/download/v0.4.7/kitops-darwin-x86_64.tar.gz"
      sha256 "e44ff4f71512ccb6f55478276557bf975ac767df965df14df50c03d17febdc70"
    end

  end

  on_linux do
    on_arm do
      url "https://github.com/brett-hodges/kitops/releases/download/v0.4.7/kitops-linux-arm64.tar.gz"
      sha256 "c1780f1c66b1c87c13ca8589e630e5741429f89298c17f8a0939fb83ed4d77a5"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/brett-hodges/kitops/releases/download/v0.4.7/kitops-linux-x86_64.tar.gz"
        sha256 "7177469ba39196162a1d5b0684b310113954ffdd3e876a57c42bc03f3fc24e93"
      else
        url "https://github.com/brett-hodges/kitops/releases/download/v0.4.7/kitops-linux-i386.tar.gz"
        sha256 "1362250b5ac22f2fe62b1c0778cb55c5b96af56955771b28e2673418789fba52"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 0.4.7"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
