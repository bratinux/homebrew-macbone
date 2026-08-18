class Macbone < Formula
  desc "The backbone of your Mac – a lightweight macOS CLI"
  homepage "https://github.com/bratinux/macbone"
  url "https://github.com/bratinux/macbone.git", tag: "v0.5.0"
  license "MIT"
  head "https://github.com/bratinux/macbone.git", branch: "main"

  depends_on macos: :tahoe

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/macbone"
  end

  test do
    assert_match "macbone version #{version}", shell_output("#{bin}/macbone --version")
  end
end
