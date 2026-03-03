xml.instruct!
xml.feed xmlns: "http://www.w3.org/2005/Atom" do
  xml.title "develumpen.com"
  xml.id feed_url
  xml.link href: feed_url
  xml.updated @entries.first.created_at.iso8601 if @entries.any?

  @entries.each do |entry|
    xml.entry do
      xml.title entry.title
      xml.id entry_slug_url(entry.slug)
      xml.link href: entry_slug_url(entry.slug)
      xml.updated entry.updated_at.iso8601
      xml.published entry.created_at.iso8601

      xml.content(type: "html") do
        xml.cdata! sanitize(entry.body_html)
      end
    end
  end
end
