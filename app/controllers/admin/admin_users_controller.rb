class Admin::AdminUsersController < ApplicationController
  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      flash[:notice] = 'User information updated successfully.'
      redirect_to admin_parent_users_path
    else
      flash[:alert] = 'Failed to update user information.'
      render :edit
    end
  end

  def change_password
    @user = User.find_by(id: params[:id])
  end

  def update_password
    if @user.update(password_params)
      flash[:notice] = 'Password updated successfully.'
      redirect_to edit_admin_admin_user_path(@user)
    else
      flash[:alert] = 'Failed to update password.'
      render :change_password
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :mobile_number, :address, :name)
  end

  def password_params
    params.require(:user).permit(:password)
  end
end
