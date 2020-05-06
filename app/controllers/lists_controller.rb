class ListsController < ApplicationController
    before_action :logged_in?
    before_action :find_list, only: :update
    before_action :can_edit_or_delete, only: [:edit, :destroy]

    def index 
        @list = List.all
    end

    def show 
        if !find_list
            redirect_to new_list_path, alert: "List not found! Please make a new list."
        end
    end

    def new 
        @list = List.new
    end

    def edit 
    end

    def create 
        @list = List.new(list_params)
        if @list.save
            redirect_to list_tasks_path(@list)
        else 
            render 'new'
        end
    end

    def update 
        if @list.update(list_params)
            redirect_to list_tasks_path(@list)
        else
            render 'edit'
        end
    end

    def destroy 
        @list.destroy
        redirect_to lists_path
    end

    private 

    def list_params 
        params.require(:list).permit(:name, :created_by)
    end

    def find_list 
        @list = List.find_by(id: params[:id])
    end

    def can_edit_or_delete
        find_list
        if helpers.current_user.name == @list.created_by
            @list
        else
            redirect_to lists_path, alert: "You do not have the permissions to edit this task"
        end
    end

end
