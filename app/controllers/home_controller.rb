class HomeController < ApplicationController
  layout "minimal", only: :mvp

  # def index; end;
  # def mvp;end;

  def contact
    unless params[:info]
      flash.now[:contact_error] = "Please fill out the contact form"
      return render 'mvp', status: 400
    end
    ContactMailer.contact_request(params[:info]).deliver
    flash[:contact_info] = "Thanks for the message, we'll contact you soon."
    redirect_to root_path
  end

end
