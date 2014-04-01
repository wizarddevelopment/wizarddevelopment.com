class ContactMailer < ActionMailer::Base

  def contact_request(contact_request)
    @contact_request = contact_request

    opts = {
      to: 'francis@wizarddevelopment.com',
      subject: 'Someone wants to hear from you!',
      from: contact_request.email || "unknown@wizarddevelopment.com"
    }

    mail(opts).deliver
  end

end
