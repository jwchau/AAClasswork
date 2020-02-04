class SubsController < ApplicationController
    before_action :require_login, only:[:edit,:update,:create,:destroy]
    def index
        @subs = Sub.all
        render :index
    end

    def new
        @sub = Sub.new
        render :new
    end 

    def create
        @sub = Sub.new(sub_params)
        @sub.moderator_id = current_user.id
        if @sub.save
           redirect_to sub_url(@sub) 
        else
            flash[:errors] = @sub.errors.full_messages
            redirect_to new_sub_url
        end 
    end 

    def edit
        @sub = Sub.find_by(id: params[:id])
        if @sub.moderator_id == current_user.id
            render :edit
        end
    end

    def show
        @sub = Sub.find_by(id: params[:id])
        render :show
    end 

    def update
        @sub = Sub.find_by(id: params[:id])
        if @sub.update_attributes(sub_params)
            redirect_to sub_url(@sub)
        else 
            flash[:errors] = @sub.errors.full_messages
            redirect_to sub_url(@sub) #sub without the edits
        end 
    end 

    def destroy
        @sub = Sub.find_by(id: params[:id])
        
        if current_user.id == @sub.moderator.id
           
            @sub.destroy
            redirect_to subs_url
        else
            flash[:errors] = ["Can't destroy sub"]
        end
    end 

    private

    def sub_params
        params.require(:sub).permit(:title, :description)
    end 
end
