class ContactRequestsController < ApplicationController

  def create
    contact = params.require(:contact_request).permit(
      :name,
      :email,
      :phone,
      :business_name,
      :message,
      :dev_team,
      :product_status
    )

    @contact_request = ContactRequest.new(contact)
    if @contact_request.save
      redirect_to root_path, notice: "thanks!"
    else
      render :blank, status: 401
    end
  end
end