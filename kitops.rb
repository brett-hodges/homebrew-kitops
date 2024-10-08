class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/brett-hodges/kitops/releases/download/v0.4.8/kitops-darwin-arm64.tar.gz"
      sha256 "3a04789a503fe532705de2cbad019e535611a1da51d16a830b509e4c2a883e94"
    end
    on_intel do
      url "https://github.com/brett-hodges/kitops/releases/download/v0.4.8/kitops-darwin-x86_64.tar.gz"
      sha256 "e50ac38f38da6972c5dd2c139968fba59102fb653e498847d333fbb3bf0d9458"
    end

  end

  on_linux do
    on_arm do
      url "https://github.com/brett-hodges/kitops/releases/download/v0.4.8/kitops-linux-arm64.tar.gz"
      sha256 "7a00d8989759345fab84b54b5bac6fe8c4f9b27a516cf0d96c4286a4c25613a7"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/brett-hodges/kitops/releases/download/v0.4.8/kitops-linux-x86_64.tar.gz"
        sha256 "70a821c4b8cc32706a8017534ec94f2fbd3e9a948d6b87f17da14b52f00e645a"
      else
        url "https://github.com/brett-hodges/kitops/releases/download/v0.4.8/kitops-linux-i386.tar.gz"
        sha256 "008b3950e9a274e51bbcb53c7c21bb90dc5290366209a9aae990a90defc50d54"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 0.4.8"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
