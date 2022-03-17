class UsersController < ApplicationController

    def create
        if params[:name] != ""
            user = User.find_or_create_by(user_params)
            render json: user, include: :user_times
        else
    end

    def show
    end

    private

    def user_params
        params.require(:user).permit(:name)
    end

end