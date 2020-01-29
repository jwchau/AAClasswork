class UsersController < ApplicationController
    # before_action :ensure_login, except: [ :new, :create ]

    def index
        @users = User.all
        render :index
    end

    def new
        @user = User.new
        render :new
    end

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:session_token] = @user.session_token
            flash[:succ] = "Successfully created user"
            redirect_to user_url(@user)
        else
            flash.now[:fail] = "Failed to create user"
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end
    
    def ensure_login
        unless logged_in?
            flash[:fail] = "Need to login or sign-up"
            redirect_to new_user_url
        end
    end

    def destroy
        render plain: "not implemented"
    end

    def user_params
        params.require(:user).permit(:email, :password)
    end

end
