class UsersController < ApplicationController


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
    else
      #re-render new view if it doesn't pass validations
    end
    # @user.authenticate
    redirect_to @user
  end


  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end


end


