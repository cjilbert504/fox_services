class TasksController < ApplicationController
    before_action :find_task, only: [:show, :edit, :update, :destroy]

    def index 
        if params[:list_id].present?
            @list = List.find_by(id: params[:list_id])
            render layout: "list_show"
        else
            @tasks = Task.order(:list_id)
        end
    end

    def show
    end

    def new 
        list = List.find_by(id: params[:list_id])
        if list
            @task = list.tasks.build
        else
            redirect_to lists_path, alert: "List not found!"
        end
    end

    def edit 
    end

    def create 
        @task = Task.new(task_params)
        if @task.save
            redirect_to list_tasks_path(@task.list)
        else
            render 'new'
        end
    end

    def update 
        if @task.update(task_params)
            redirect_to list_tasks_path(@task.list)
        else
            render 'edit'
        end
    end

    def destroy 
        list = @task.list
        @task.destroy
        redirect_to list_tasks_path(list)
    end

    private 

    def task_params 
        params.require(:task).permit(:title, :content, :list_id, :completed, :address, :employee_id)
    end

    def find_task 
        @task = Task.find_by(id: params[:id])
    end
end
