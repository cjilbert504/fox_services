class TasksController < ApplicationController

    before_action :logged_in?
    before_action :find_task, only: [:show, :update]
    before_action :can_edit_or_complete, only: [:edit, :destroy]
    rescue_from ActiveRecord::RecordNotFound, with: :invalid_list

    def index 
        if params[:list_id].present?
            find_list
            @tasks = @list.tasks
        else
            @tasks = Task.most_recent
        end
        render layout: "list_tasks"
    end

    def show
    end

    def new 
        find_list
        @task = @list.tasks.build
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

    def find_list
        @list = List.find(params[:list_id])
    end

    def authorized
        helpers.current_user.name == @task.list.created_by || helpers.current_user == @task.employee
    end

    def can_edit_or_complete
        find_task
        redirect_to list_tasks_path(@task.list), alert: "You do not have the permissions to edit this task" unless !!authorized
    end

    def invalid_list
        logger.error "Attempt to access invalid list #{params[:list_id]}" 
        redirect_to lists_path, alert: 'Invalid list'
    end
    
end
