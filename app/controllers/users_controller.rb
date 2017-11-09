class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # byebug
    if user_params[:password] == user_params[:password_confirmation]
      user = User.new(name: user_params[:name], email: user_params[:email], password: user_params[:password])
      if user.save
        session[:user_id] = user.id
        redirect_to '/'
      else
        redirect_to '/register'
      end
    else
      render 'users/new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
