class ListsController < ApplicationController

    def index 
        @list = List.all
    end

    def show 
        @list = List.find_by(id: params[:id])
    end

    def new 
        @list = List.new
    end

    def edit 
        @list = List.find_by(id: params[:id])
    end

    def create 
        @list = List.new(list_params)
        @list.save
        redirect_to list_path(@list)
    end

    def update 
        @list = List.find_by(id: params[:id])

        if @list.update(list_params)
            redirect_to list_path(@list)
        else
            render 'edit'
        end
    end

    def destroy 
        @list = List.find_by(id: params[:id])
        @list.destroy

        redirect_to new_list_path
    end

    private 

    def list_params 
        params.require(:list).permit(:name)
    end
end
