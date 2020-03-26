# Preview all emails at http://localhost:3000/rails/mailers/customer_mailer
class CustomerMailerPreview < ActionMailer::Preview

    def email_received
        contact_message = ContactMessage.new(name: "Collin", email: "collin@collin.com", body: "email preview working???")
        CustomerMailer.with(contact_message: contact_message).email_received
    end

end
