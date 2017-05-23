class UsersController < ApplicationController
  def show
    set_user
  end
  def edit
    set_user
  end

  def update
    set_user.update(user_params)
    redirect_to user_path(current_user.id)
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :school)
  end
end
