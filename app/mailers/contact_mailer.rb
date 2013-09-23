class ContactMailer < ActionMailer::Base
  default from: "unknown@wizardcomputing.com"

  def contact_request(info)
    @name = info[:name]
    @email = info[:email]
    @reason = info[:reason]
    @message = info[:message]

    opts = {
      to: 'francis@wizardcomputing.com',
      subject: 'Someone wants to hear from you!'
    }
    opts[:from] = @email if @email

    mail(opts)
  end

end
