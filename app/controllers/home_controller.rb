class HomeController < ApplicationController
  def index
    @developers = Developer.order(:id)
    @latest_articles = BlogEntry.latest_blog_post(6)
  end

  def clients
  end

  def bakecycle
  end

  def winnower
  end
end
