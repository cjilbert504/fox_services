class TasksController < ApplicationController

    def index 
        # add ability to function as normal if no list id is passed in
        @list = List.find_by(id: params[:list_id])
        render layout: "list_show"
    end

    def show
        find_task
    end

    def new 
        #add some conditional logic here to handle list not found
        list = List.find_by(id: params[:list_id])
        @task = list.tasks.build
        # @task = Task.new(list_id: params[:list_id])
    end

    def edit 
        find_task
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
        find_task
        
        if @task.update(task_params)
            redirect_to list_tasks_path(@task.list)
        else
            render 'edit'
        end
    end

    def destroy 
        find_task
        
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
