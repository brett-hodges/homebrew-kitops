class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/brett-hodges/kitops/releases/download/0.4.3/kitops-darwin-arm64.tar.gz"
      sha256 "1f35ad95a3b8ee279983bf3eba2348f0921e9f109f6d0e8a4fae1752e8f0bd61"
    end
    on_intel do
      url "https://github.com/brett-hodges/kitops/releases/download/0.4.3/kitops-darwin-x86_64.tar.gz"
      sha256 "86be0382c71776adf6592d2ddadf15a7b2c52d316f6e996be61b1d18e4d3a0a4"
    end

  end

  on_linux do
    on_arm do
      url "https://github.com/brett-hodges/kitops/releases/download/0.4.3/kitops-linux-arm64.tar.gz"
      sha256 "03172dffae39361026ab086f48aebe2e276b4e476ec22ee5a17adfdcb08ff439"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/brett-hodges/kitops/releases/download/0.4.3/kitops-linux-x86_64.tar.gz"
        sha256 "d09a0520354c632908ef6a986fb4cf9e489efe42a4235328ab18a3bc01231f6b"
      else
        url "https://github.com/brett-hodges/kitops/releases/download/0.4.3/kitops-linux-i386.tar.gz"
        sha256 "8beb54cffd8eada55ee23d507764a7e2f53469dd8188c9a8cd37e5373d5842a0"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 0.4.3"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
