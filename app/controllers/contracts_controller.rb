class ContractsController < ApplicationController
  before_action :hide_nav

  def view
    client = OpenStruct.new({
      name: 'vRide Inc.',
      full_address: 'vRide, Inc., 568 Broadway, Ste 603a, New York, NY. 10012',
      accepted_date: '10/20/2014'
    })
    @content = render_to_string partial: 'msa', locals: { client: client }
  end
end
