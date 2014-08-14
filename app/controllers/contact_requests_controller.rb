class ContactRequestsController < ApplicationController
  respond_to :json

  def create
    @contact_request = ContactRequest.new(contact_params)
    if @contact_request.save
      ContactRequest.delay.send_notification_email(@contact_request.id)
      render json: @contact_request, status: :created
    else
      render json: @contact_request.errors, status: :unprocessable_entity
    end
  end

  private

  def contact_params
    params.require(:contact_request).permit(
      :name,
      :email,
      :phone,
      :message
    )
  end
end