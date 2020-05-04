require 'securerandom'

class SessionsController < ApplicationController

    def new 
        @employee = Employee.new
    end

    def create
        employee = Employee.find_by(email: params[:employee][:email])
        if employee && employee.authenticate(params[:employee][:password])
            session[:user_id] = employee.id
            redirect_to employee_path(employee)
        else
            redirect_to new_session_path, alert: "User not found. Please try again."
        end
    end

    def omni
        @employee = Employee.find_or_create_by(email: auth[:info][:email]) do |e|
            e.uid = auth['uid']
            e.name = auth['info']['name']
            e.password = SecureRandom.alphanumeric(10)
        end   
          session[:user_id] = @employee.id
          redirect_to employee_path(@employee)
    end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end
