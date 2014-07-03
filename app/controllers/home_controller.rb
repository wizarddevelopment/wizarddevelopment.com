class HomeController < ApplicationController

  def index
    @employees = Employee.all
  end

  def pricing; end


end
