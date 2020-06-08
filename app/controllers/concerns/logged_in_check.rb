module LoggedInCheck

    private

    def logged_in?
        redirect_to login_path, alert: "You must be logged in to do that" unless !!session[:user_id]
    end

end