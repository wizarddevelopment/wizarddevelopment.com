class ContactMailer < ActionMailer::Base

  def contact_request(info)
    @name = info[:name]
    @email = info[:email]
    @reason = info[:reason]
    @message = info[:message]

    opts = {
      to: 'francis@wizardcomputing.com',
      subject: 'Someone wants to hear from you!',
      from: @email || "unknown@wizardcomputing.com"
    }

    mail(opts)
  end

end
