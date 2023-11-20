class Admin::AdminUsersController < ApplicationController
  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to admin_admin_users_path
      flash[:notice] = 'Profile updated successfully.'
    else
      flash[:alert] = 'Failed to update user information.'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :mobile_number, :address, :name)
  end
end
