class ContactRequest < ActiveRecord::Base
  validates_presence_of :name, :message
  validates :email, presence: true, email: true

  def self.send_notification_email(contact_request_id)
    contact_request = find(contact_request_id)
    ContactMailer.contact_request(contact_request)
  end
end
