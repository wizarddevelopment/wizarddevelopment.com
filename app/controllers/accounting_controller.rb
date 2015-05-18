class AccountingController < ApplicationController
  def index
    hide_nav
    @accounts = AccountingService.new
  end
end
