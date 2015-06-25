class BlogEntry < ActiveRecord::Base
  has_attached_file :blog_image, styles: {
    medium: '300x300>'
  }

  validates_attachment_content_type :blog_image, content_type: /\Aimage\/.*\Z/

  def self.update_blog(blog_rss_url = ENV['BLOG_RSS_URL'])
    blog = Feedjira::Feed.fetch_and_parse(blog_rss_url)
    create_or_update_entries(blog.entries)
  end

  def self.create_or_update_entries(entries)
    entries.map { |entry| create_or_update_entry(entry) }
  end

  def self.create_or_update_entry(entry)
    blog_entry = where(guid: entry.id).first_or_initialize
    blog_entry.assign_attributes(
      name:         entry.title,
      summary:      entry.summary,
      url:          entry.url,
      published_at: entry.published,
      blog_image:   entry.image || extract_image(entry.content)
    )
    blog_entry.save!
  end

  def self.extract_image(content)
    html_doc = Nokogiri::HTML(content)
    image = html_doc.xpath("//img[@alt='cover' and @src!='']").first
    image.get_attribute("src") if image
  end

  def self.latest_blog_post(amount)
    limit(amount).order('published_at desc')
  end

  def date
    published_at.strftime("%B %d, %Y")
  end
end
