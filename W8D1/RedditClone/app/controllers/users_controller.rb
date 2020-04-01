class UsersController < ApplicationController
    before_action :require_login, only: [:destroy, :edit, :update]
    def new
        @user = User.new
        render :new
    end 

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end 
    end 

    def edit 
        @user = User.find_by(id: params[:id])
        render :edit
    end

    def update
        # #assuming only time edit button shows up is when they're logged in and on their show page
        # @user = User.find_by(username: params[:user][:username]) #extra precaution, i.e. if changed username
        # @user.update(user_params)

        #assume that edit button is always available
        if current_user.username == params[:user][:username]
            current_user.update(user_params)
        else
            flash.now[:errors] = current_user.errors.full_messages
            render :edit
        end 

    end 

    def show 
        @user = User.find_by(id: params[:id])
        if @user
            render :show
        else
            flash[:errors] = ['User does not exist']
            render '404.html.erb'
            
        end
    end 

    def index
        @users = User.all
        render :index
    end 
        
    

    def destroy
        if current_user.id == params[:id]
            current_user.destroy
        else
            flash[:errors] = ['Can\'t destroy user because you are not this user']
            redirect_to user_url(current_user)
        end 
    end 

    private 
    def user_params
        params.require(:user).permit(:username, :password)
    end 

end
