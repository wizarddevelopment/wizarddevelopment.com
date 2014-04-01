class ContactRequestsController < ApplicationController

  def create
    @contact_request = ContactRequest.new(contact_params)
    if @contact_request.save
      ContactMailer.contact_request(@contact_request)
      redirect_to root_path, notice: "Thank you, we'll be contacting you shortly!"
    else
      render :blank, status: 401
    end
  end

  private

  def contact_params
    params.require(:contact_request).permit(
      :name,
      :email,
      :phone,
      :business_name,
      :message,
      :dev_team,
      :product_status
    )
  end
end