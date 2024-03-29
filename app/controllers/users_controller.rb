class UsersController < ApplicationController

    def create
        if params[:name] != ""
            user = User.find_or_create_by(user_params)
            render json: user, include: :user_times
        else
            render json: {err_message: "Name cannot be blank!" }
        end
    end

    def show
        user = User.find_by(id: params[:id])
            render json: user, include: :user_times
    end

    private

    def user_params
        params.require(:user).permit(:name)
    end

end