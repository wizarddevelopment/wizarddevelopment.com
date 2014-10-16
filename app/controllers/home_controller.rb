class HomeController < ApplicationController
  def index
    @employees = Employee.order(:id)
    @latest_articles = BlogEntry.latest_blog_post(3)
  end

  def bien_cuit
  end
end
