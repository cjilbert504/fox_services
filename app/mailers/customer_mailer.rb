class CustomerMailer < ApplicationMailer
    # default from: 'fox@foxservices.com'

    def email_received
        @contact_message = params[:contact_message]
        mail(to: @contact_message.email, subject: "Thank You! You're email has been received")
    end
end
