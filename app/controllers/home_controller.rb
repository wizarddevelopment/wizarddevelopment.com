class HomeController < ApplicationController
  def index
    @developers = Developer.order(:id)
    @latest_articles = BlogEntry.latest_blog_post(6)
  end

  def clients
    black_nav
  end

  def bakecycle
    black_nav
  end

  def winnower
    black_nav
  end

  def demo
    black_nav
  end
end
