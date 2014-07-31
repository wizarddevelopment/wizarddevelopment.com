class HomeController < ApplicationController

  def index
    @employees = Employee.order(:id)
  end

  def pricing; end


end
