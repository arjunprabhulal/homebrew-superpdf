# Homebrew tap for superPDF AI

[superPDF AI](https://superpdf.ai): PDF tools that run on your computer. Read PDFs into Markdown, HTML or JSON
(tables, charts as data, OCR for scans), convert them to Word, PowerPoint, Excel and EPUB, fill forms, compare,
merge and protect them, from the command line, an MCP server for AI assistants, or a local REST API. Nothing is
uploaded.

## Install

```bash
brew install arjunprabhulal/superpdf/superpdf
superpdf help
```

Or tap first, then install: `brew tap arjunprabhulal/superpdf` and `brew install superpdf`. In a `Brewfile`:

```ruby
tap "arjunprabhulal/superpdf"
brew "superpdf"
```

Upgrade with `brew upgrade superpdf`. The formula installs the
[`@superpdf/cli`](https://www.npmjs.com/package/@superpdf/cli) package from npm, with Node.js from Homebrew.

## Use it

```bash
superpdf export report.pdf --output report.md
superpdf mcp --allow-dir ~/Documents/superPDF    # MCP server for AI assistants
superpdf serve --allow-dir ~/Documents/superPDF  # local REST API
```

Docs: [superpdf.ai/docs/mcp-api/command-line-tools](https://superpdf.ai/docs/mcp-api/command-line-tools). Source:
[github.com/arjunprabhulal/superpdf](https://github.com/arjunprabhulal/superpdf). Python: `pip install superpdf`.

## License

[Apache-2.0](LICENSE)
