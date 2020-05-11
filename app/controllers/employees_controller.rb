class EmployeesController < ApplicationController

    before_action :logged_in?, only: [:index, :show, :edit, :destroy]
    before_action :find_employee, only: [:show, :edit, :update, :destroy]

    def index 
        @employees = Employee.all
    end

    def show 
        
    end

    def new 
        @employee = Employee.new
    end

    def edit 

    end

    def create 
        @employee = Employee.new(employee_params)
        if @employee.save
            session[:user_id] = @employee.id
            redirect_to employee_path(@employee), notice: "Thank you for signing up!"
        else
            render 'new'
        end
     
    end

    def update 
        if helpers.current_user == @employee && @employee.update(employee_params)
            redirect_to employee_path(@employee)
        else
            redirect_to employee_path(helpers.current_user), alert: "You do not have permission to edit this account"
        end
    end

    def destroy 
        if helpers.current_user == @employee
            session.delete :user_id
            @employee.destroy
            redirect_to root_path
        else
            redirect_to employee_path(helpers.current_user), alert: "You do not have permission to delete this account"
        end
    end

    private

    def find_employee
        redirect_to root_path, alert: "Employee not found!" unless @employee = Employee.find_by(id: params[:id])
    end

    def employee_params 
        params.require(:employee).permit(:name, :email, :password, :password_confirmation)
    end

end
