class TasksController < ApplicationController

    def show
        find_task
    end

    def edit 
        find_task
    end

    def create 
        @task = Task.new(task_params)
        @task.save
        redirect_to list_path(@task.list)
    end

    def update 
        find_task
        
        if @task.update(task_params)
            redirect_to list_path(@task.list)
        else
            render 'edit'
        end
    end

    private 

    def task_params 
        params.require(:task).permit(:title, :content, :list_id)
    end

    def find_task 
        @task = Task.find_by(id: params[:id])
    end
end
