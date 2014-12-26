class ContactRequest < ActiveRecord::Base
  validates :name, presence: true
  validates :message, presence: true
  validates :email, presence: true, email: true
end
