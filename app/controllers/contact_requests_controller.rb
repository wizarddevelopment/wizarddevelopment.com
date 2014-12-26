class ContactRequestsController < ApplicationController
  def create
    @contact_request = ContactRequest.new(contact_params)
    if @contact_request.save
      ContactMailer.contact_request(@contact_request).deliver
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
