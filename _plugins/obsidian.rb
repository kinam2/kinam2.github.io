# Obsidian 문법을 웹용으로 바꿔 주는 작은 플러그인
# - [[노트]] / [[노트|별칭]] -> 글자만 남김
# - ![[임베드]] -> 지움
# - > [!type] 제목 (callout) -> 굵은 제목이 있는 인용 상자
Jekyll::Hooks.register [:posts, :pages], :pre_render do |doc|
  next unless doc.extname == ".md"
  c = doc.content
  c = c.gsub(/!\[\[[^\]]*\]\]/, "")
  c = c.gsub(/\[\[([^\]|]*)\|([^\]]+)\]\]/) { $2 }
  c = c.gsub(/\[\[([^\]]+)\]\]/) { $1.sub(/^#/, "").sub("#", " › ") }
  c = c.gsub(/^([ \t]*>[ \t]*)\[!(\w+)\][-+]?[ \t]*(.*)$/) do
    pre, type, title = $1, $2, $3.strip
    title = type.capitalize if title.empty?
    "#{pre}**#{title}**\n#{pre.rstrip}"
  end
  doc.content = c
end
