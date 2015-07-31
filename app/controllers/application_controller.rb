class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hide_nav
    # @_hide_nav = true
  end
end
