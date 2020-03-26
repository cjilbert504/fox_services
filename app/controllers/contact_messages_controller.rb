class ContactMessagesController < ApplicationController
    def new
        @contact_message = ContactMessage.new
    end

    def create
        @contact_message = ContactMessage.new(post_params)

        if @contact_message.save
            CustomerMailer.with(contact_message: @contact_message).email_received.deliver_later
            redirect_to root_path
        else
            render :new
        end
    end

    private

    def post_params
        params.require(:contact_message).permit(:name, :email, :body)
    end
end
