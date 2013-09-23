class HomeController < ApplicationController
  layout "minimal", only: :mvp

  # def index; end;
  # def mvp;end;

  def contact
    return render status: 400, json: "No Info" unless params[:info]
    ContactMailer.contact_request(params[:info]).deliver
    render json: 'Success!'
  end

end
