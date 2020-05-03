class EmployeesController < ApplicationController
    before_action :logged_in?, only: [:index, :show, :edit]

    def index 

    end

    def show 
        @employee = Employee.find_by(id: params[:id])
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

    end

    def destroy 

    end

    private 

    def employee_params 
        params.require(:employee).permit(:name, :email, :phone_number, :password, :password_confirmation)
    end

end
