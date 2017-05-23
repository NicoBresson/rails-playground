class UsersController < ApplicationController
  def show
    set_user
  end
  def edit
    set_user
  end

  def update
    # if user_params[:first_name] && user_params[:last_name] && user_params[:school]
    #   set_user.update(user_params)
    #   redirect_to user_path(current_user.id)
    if params[:user][:school_id].blank?
      flash[:alert] = "Don't forget to add a school"
      redirect_to edit_user_path(current_user)
    elsif params[:user][:first_name].blank? || params[:user][:last_name].blank?
      flash[:alert] = "Don't forget to add your name"
      redirect_to edit_user_path(current_user)
    else
      if current_user.update(user_params)
        flash[:notice] = "Your profile has been updated"
        redirect_to user_path(current_user.id)
      else
        redirect_to edit_user_path(current_user)
      end
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :school_id)
  end
end
