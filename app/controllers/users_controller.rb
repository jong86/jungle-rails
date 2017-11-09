class UsersController < ApplicationController
  def login
  end

  def logout
  end


  def register
    @user = User.new
  end


  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to [:root], notice: 'You are now registered!'
    else
      render register_users_path
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
    )
  end
end
