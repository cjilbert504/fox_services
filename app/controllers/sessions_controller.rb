class SessionsController < ApplicationController

    def destroy
        session.delete
        redirect_to root_path
    end
end
