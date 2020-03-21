class ApplicationController < ActionController::Base

    def home
        render html: "Welcome to Fox Services!"
    end
end
