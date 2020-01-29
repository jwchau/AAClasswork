class SessionsController < ApplicationController
    # before_action :ensure_login, except: [ :new, :create ]

    def new
        render :new
    end

    def create
        @user = User.find_by_credentials(
            sarams[:email],
            sarams[:password]
        )
        if @user
            log_in_user!(@user)
            redirect_to user_url(@user)
        else
            flash[:fail] = "Wrong email/password combination"
            render :new
        end
    end

    def destroy
        if logged_in?
            flash[:succ] = "Logout success"
            current_user.reset_session_token!
            session[:session_token] = nil
            redirect_to new_session_url
        else
            flash.now[:fail] = "failed to logout"
        end
    end

    def ensure_login
        if !logged_in?
            flash[:fail] = "Need to login or sign-up"
            redirect_to new_session_url
        end
    end

    def sarams
        params.require(:session).permit(:email, :password)
    end
end
