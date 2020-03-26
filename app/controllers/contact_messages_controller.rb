class ContactMessagesController < ApplicationController
    def new
        @contact_message = ContactMessage.new
    end

    def create
        @contact_message = ContactMessage.new(post_params)
        @contact_message.save
        binding.pry
        CustomerMailer.with(contact_message: @contact_message).email_received.deliver_now
        redirect_to root_path
    end

    private

    def post_params
        params.require(:contact_message).permit(:name, :email, :body)
    end
end
