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

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

end
