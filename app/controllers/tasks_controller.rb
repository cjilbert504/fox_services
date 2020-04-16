class TasksController < ApplicationController

    def create 
        @task = Task.new(task_params)
        @task.save
        redirect_to list_path(@task.list)
    end

    private 

    def task_params 
        params.require(:task).permit(:title, :content, :list_id)
    end
end
