class Superpdf < Formula
  desc "PDF tools on your computer: Markdown, tables, OCR, CLI, MCP server and API"
  homepage "https://superpdf.ai"
  url "https://registry.npmjs.org/@superpdf/cli/-/cli-0.4.0.tgz"
  sha256 "809ddc1a903dc3e5541b37a212ba2828f46bdc3caf2039f7a4f4a9e6fbef5417"
  license "Apache-2.0"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/superpdf --version")

    (testpath/"notes.md").write "# Launch notes\n\nMade by the Homebrew test.\n"
    system bin/"superpdf", "tool", "pdf_from_markdown",
           "--input", '{"input":"notes.md","output":"notes.pdf"}'
    assert_path_exists testpath/"notes.pdf"
    assert_match '"pages": 1', shell_output("#{bin}/superpdf info notes.pdf")
    assert_match "Launch notes", shell_output("#{bin}/superpdf export notes.pdf")
  end
end
