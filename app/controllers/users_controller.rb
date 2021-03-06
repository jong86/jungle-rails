class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if user_params[:password] == user_params[:password_confirmation]
      user = User.new(user_params)
      if user.save
        UserMailer.welcome_email(user).deliver_now # Sends confirmation email
        session[:user_id] = user.id
        redirect_to '/'
      else
        redirect_to '/register'
      end
    else
      redirect_to '/register'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
