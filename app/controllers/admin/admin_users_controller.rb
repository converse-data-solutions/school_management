# frozen_string_literal: true

# this is a controller for standards page
class Admin::AdminUsersController < ApplicationController
  def edit
    @user = User.find_by(id: params[:id])
    return if @user.present?

    flash[:alert] = 'User not found.'
    redirect_to admin_admin_users_path
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to edit_user_registration_path
      flash[:notice] = 'Profile successfully updated.'
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
