class UsersController < ApplicationController
    def index
        # render plain: 'User_controller#index'
        users = User.all
        render json: users
    end

    def show
        # render plain: "User_controller#show id: #{params[:id]}"
        # render json: params
        user = User.find_by(id: params[:id])
        render json: user
    end

    def create
        # render plain:'User_controller#create'
        # render json: params
        
        user = User.new(user_params)
        if user.save
            # render json: user
            redirect_to "/users/#{user.id}"
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    
    end

    def update
        # render plain: "User_controller#update id: #{params[:id]}"
        # render json: Chirp.find(params[:id])

        user = User.find_by(id: params[:id])

        if user.update(user_params)
            render json: user
        else
            render json: user.errors.full_messages, status: 422
        end

    end

    def destroy
        # render plain: "user_controller#destroy id: #{params[:id]}"

        user = User.find_by(id: params[:id])
        user.destroy
        render json: user
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end

end
