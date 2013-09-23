class HomeController < ApplicationController
  layout "minimal", only: :mvp

  # def index; end;
  # def mvp;end;

  def contact
    raise "no info!" unless params[:info]
    ContactMailer.contact_request(params[:info]).deliver
    flash[:contact_info] = "Thanks for the message, we'll contact you soon."
    redirect_to root_path
  rescue
    flash.now[:contact_error] = "Please fill out the contact form"
    return render 'mvp', status: 400
  end

end
