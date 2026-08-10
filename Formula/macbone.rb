class Macbone < Formula
  desc "The backbone of your Mac – a lightweight macOS CLI"
  homepage "https://github.com/bratinux/macbone"
  url "https://github.com/bratinux/macbone.git", tag: "v0.1.0"
  license "MIT"
  head "https://github.com/bratinux/macbone.git", branch: "main"

  depends_on xcode: ["16.0", :build]
  depends_on macos: :sequoia

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/macbone"
  end

  test do
    assert_match "macbone version #{version}", shell_output("#{bin}/macbone --version")
  end
end
