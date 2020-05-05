class TasksController < ApplicationController
    before_action :logged_in?
    before_action :find_task, only: [:show, :update, :destroy]
    before_action :can_edit_or_complete, only: :edit

    def index 
        if params[:list_id].present?
            @list =  List.find_by(id: params[:list_id])
            if @list
                @tasks = @list.tasks
                render layout: "list_tasks"
            else
                redirect_to lists_path, alert: "List not found!"
            end
        else
            @tasks = Task.order(:list_id)
            render layout: "list_tasks"
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
        redirect_to lists_path, alert: "Task not found!" unless @task = Task.find_by(id: params[:id])
    end

    def can_edit_or_complete
        find_task
        if helpers.current_user.name == @task.list.created_by || helpers.current_user == @task.employee
            @task
        else
            redirect_to list_tasks_path(@task.list), alert: "You do not have the permissions to edit this task"
        end
    end
end
