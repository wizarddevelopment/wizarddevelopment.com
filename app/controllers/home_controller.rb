class HomeController < ApplicationController
  def index
    @developers = Developer.order(:id)
    @latest_articles = BlogEntry.latest_blog_post(3)
  end
end
