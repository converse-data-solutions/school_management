class Admin::AdminUsersController < ApplicationController
  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'User information updated successfully.'
      redirect_to admin_parent_users_path
    else
      flash[:alert] = 'Failed to update user information.'
      render :edit
    end
  end
end
