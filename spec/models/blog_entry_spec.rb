require 'rails_helper'

describe BlogEntry do
  describe ".create_or_update_entries" do
    it "creates new blog entries" do
      entries = [
        OpenStruct.new(
          {
            title: "title",
            summary: "summary",
            id: "XXXX"
          }
        )
      ]
      BlogEntry.create_or_update_entries(entries)
      expect(BlogEntry.count).to eq(1)
    end

    it "updates blog entries with the same guid" do
      entries = [
        OpenStruct.new({
          title: "title",
          summary: "summary",
          id: "XXXX"
        }),
        OpenStruct.new({
          title: "hello",
          summary: "stuff",
          id: "XXXX"
        })
      ]
      BlogEntry.create_or_update_entries(entries)
      expect(BlogEntry.count).to eq(1)
      expect(BlogEntry.first.name).to eq('hello')
    end
  end

  describe '#fetch_image' do
    it "parses html returns first image with alt attribute of cover" do
      stub_request(:get, "http://placekitty.com/image.png")
        .to_return(status: 200, body: "")
      html = '<img src="/image-not-cover.png">
              <img alt="cover">
              <img alt="cover" src="http://placekitty.com/image.png">
              <img src="/image2.png" alt="cover">'
      blog_entry = create(:blog_entry, summary: html)
      blog_entry.fetch_image
      expect(blog_entry.blog_image.path).to include("/image.png")
    end

    it "returns nil if it can't find the image" do
      html = '<img src="/image-not-cover.png">'
      blog_entry = create(:blog_entry, summary: html)
      expect(blog_entry.blog_image.present?).to eq(false)
    end
  end

  describe ".latest_blog_post" do
    it "should show three latest articles" do
      FactoryGirl.create_list(:blog_entry, 6)
      expect(BlogEntry.latest_blog_post(3).size).to eq(3)
    end
  end
end
