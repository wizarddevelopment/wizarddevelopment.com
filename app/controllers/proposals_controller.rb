class ProposalsController < ApplicationController
  before_action :hide_nav

  def view
    @content = render_to_string partial: 'bien_cuit'
  end
end
