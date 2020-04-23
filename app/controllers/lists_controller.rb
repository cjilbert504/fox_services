class ListsController < ApplicationController

    def index 
        @list = List.all
    end

    def show 
        if !find_list 
            redirect_to new_list_path, alert: "List not found! Please make a new list." unless @list
        end
    end

    def new 
        @list = List.new
    end

    def edit 
        find_list 
    end

    def create 
        @list = List.new(list_params)
        if @list.save
            redirect_to list_path(@list)
        else 
            render 'new'
        end
    end

    def update 
        find_list 

        if @list.update(list_params)
            redirect_to list_path(@list)
        else
            render 'edit'
        end
    end

    def destroy 
        find_list 
        @list.destroy

        redirect_to lists_path
    end

    private 

    def list_params 
        params.require(:list).permit(:name)
    end

    def find_list 
        @list = List.find_by(id: params[:id])
    end
end
