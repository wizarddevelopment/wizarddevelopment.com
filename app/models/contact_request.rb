class ContactRequest < ActiveRecord::Base
  validates :name, presence: true
  validates :message, presence: true
  validates :email, presence: true, email: true

  def self.send_notification_email(contact_request_id)
    contact_request = find(contact_request_id)
    ContactMailer.contact_request(contact_request)
  end
end
