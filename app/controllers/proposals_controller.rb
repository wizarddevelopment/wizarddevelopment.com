class ProposalsController < ApplicationController
  before_action :hide_nav

  def view
    @content = render_to_string partial: params[:client]
  end
end
