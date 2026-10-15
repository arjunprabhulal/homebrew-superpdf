class Superpdf < Formula
  desc "PDF tools on your computer: Markdown, tables, OCR, CLI, MCP server and API"
  homepage "https://superpdf.ai"
  url "https://registry.npmjs.org/@superpdf/cli/-/cli-0.4.0.tgz"
  sha256 "809ddc1a903dc3e5541b37a212ba2828f46bdc3caf2039f7a4f4a9e6fbef5417"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/arjunprabhulal/homebrew-superpdf/releases/download/superpdf-0.4.0"
    sha256 cellar: :any,                 arm64_tahoe:  "664e6974c51c582e9e88cde578bf386f0389fd717a895886a5842637dd295799"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "152e25fb5fc235e0c7740426d03a8b887383a21d03a1c21b7effbd134aa465b5"
  end

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
