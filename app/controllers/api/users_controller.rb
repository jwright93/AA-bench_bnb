class Api::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    debugger
    if @user.save
      login(@user)
      render :show
    else
      render json: ["Invalid Login"]
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
