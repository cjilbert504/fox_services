class ListsController < ApplicationController

    def index 
        @list = List.all
    end

    def show 
        @list = List.find_by(id: params[:id])
        @list.tasks.build
    end

    def new 
        @list = List.new
    end

    def create 
        @list = List.new(list_params)
        @list.save
        redirect_to list_path(@list)
    end

    private 

    def list_params 
        params.require(:list).permit(:name)
    end
end
