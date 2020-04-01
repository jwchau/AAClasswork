class SessionsController < ApplicationController
    before_action :logged_in_v2, only: [:new]

    def new
        render :new
    end

    def create 
        @user = User.find_my_credentials(
            params[:user][:username],
            params[:user][:password]
        )

        if @user
            login_user!(@user)
            redirect_to cats_url 
        else
            redirect_to new_session_url # session/new is the login page
        end
    end

    def destroy
        if current_user
            current_user.reset_session_token!
            session[:session_token] = nil
            redirect_to new_session_url #takes them to login page
        end
    end

    def logged_in_v2
        if logged_in?
            redirect_to cats_url
        end


    end

    # def sarams
    #     params.require(:user).permit(:username, :password)
    # end
end
