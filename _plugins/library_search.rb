require "json"
require "uri"
require "nokogiri"

# Index the rendered catalog so search never includes unlisted files or drafts.
module LibrarySearch
  def self.source_for(root, href, baseurl)
    uri = URI.parse(URI::DEFAULT_PARSER.escape(href, /[^\x21-\x7e]/))
    return unless !uri.host && !uri.scheme && uri.path&.start_with?(baseurl + "/")

    relative = URI::DEFAULT_PARSER.unescape(uri.path.delete_prefix(baseurl + "/"))
    return if relative.empty? || relative.include?("\0")

    clean = File.expand_path(relative, root)
    return unless clean.start_with?(root + File::SEPARATOR)

    [clean, File.join(clean, "index.html"), clean + ".html"].find do |file|
      File.extname(file) == ".html" && File.file?(file) &&
        File.realpath(file).start_with?(root + File::SEPARATOR)
    end
  rescue URI::InvalidURIError, ArgumentError
    nil
  end

  def self.passages(file)
    doc = Nokogiri::HTML.parse(File.binread(file), nil, "UTF-8")
    doc.css('script, style, noscript, template, svg, nav, footer, [hidden], [aria-hidden="true"], .metadata-container, .frontmatter, .markdown-embed-link, .edit-block-button').remove
    nodes = doc.css('.canvas-node:not(.canvas-node-group) .canvas-node-content')
    if nodes.empty?
      body = doc.at_css('.post-content') || doc.at_css('main') || doc.at_css('article') || doc.at_css('body')
      nodes = [body].compact
    end
    nodes.flat_map do |node|
      node.css('br').each { |br| br.replace(Nokogiri::XML::Text.new("\n", doc)) }
      node.css('p, h1, h2, h3, h4, h5, h6, li, tr, blockquote, pre, div, section, hr').each do |block|
        block.add_previous_sibling(Nokogiri::XML::Text.new("\n", doc))
        block.add_next_sibling(Nokogiri::XML::Text.new("\n", doc))
      end
      node.text.lines.map { |line| line.gsub(/[[:space:]]+/, ' ').strip }
    end.reject(&:empty?).uniq
  end

  def self.write(site)
    root = File.realpath(site.dest)
    catalog = File.join(root, 'library', 'index.html')
    return unless File.file?(catalog)

    doc = Nokogiri::HTML.parse(File.binread(catalog), nil, "UTF-8")
    hrefs = doc.css('[data-library-entry] > a:first-child').map { |link| link['href'] }.compact.uniq
    baseurl = site.config['baseurl'].to_s.sub(%r{/$}, '')
    index = hrefs.each_with_object({}) do |href, result|
      source = source_for(root, href, baseurl)
      result[href] = passages(source) if source
    end
    File.write(File.join(root, 'library', 'search-index.json'), JSON.generate(index), encoding: 'UTF-8')
    Jekyll.logger.info 'Library search:', "indexed #{index.size} documents"
  end
end

Jekyll::Hooks.register :site, :post_write do |site|
  LibrarySearch.write(site)
end
