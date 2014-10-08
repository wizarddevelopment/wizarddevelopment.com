class BlogEntry < ActiveRecord::Base
  def self.update_from_blog(blog_rss_url)
    blog = Feedjira::Feed.fetch_and_parse(blog_rss_url)
    create_or_update_blog(blog.entries)
  end

  def self.create_or_update_blog(entries)
    entries.each do |entry|
      blog_entry = where(guid: entry.id).first_or_create
      blog_entry.update!(
          name:         entry.title,
          summary:      entry.summary,
          url:          entry.url,
          image_url:    image(entry.summary),
          published_at: entry.published
        )
    end
  end

  def self.image(html)
    html_doc = Nokogiri::HTML(html)
    return nil if html_doc.xpath("//img[@alt='cover']").empty?

    html_doc.xpath("//img[@alt='cover']").each do |img|
      src = img.get_attribute("src")
      return src if src
    end
    nil
  end

  def self.latest_blog_post(amount)
    limit(amount).order('published_at desc')
  end

  def date
    published_at.strftime("%B %d, %Y")
  end
end
