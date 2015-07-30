class ContactMailer < ActionMailer::Base
  def contact_request(contact_request)
    @contact_request = contact_request

    opts = {
      to: 'hello@wizarddevelopment.com',
      subject: 'Project inquiry',
      from: contact_request.email || "unknown@wizarddevelopment.com"
    }

    mail(opts)
  end
end
