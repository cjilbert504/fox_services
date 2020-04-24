class EmployeesController < ApplicationController

    def index 

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
            redirect_to employee_path(@employee)
        end
    end

    def update 

    end

    def destroy 

    end

    private 

    def employee_params 
        params.require(:employee).require(:name, :email)
    end

end
