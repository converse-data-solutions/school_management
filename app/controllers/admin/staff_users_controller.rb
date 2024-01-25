# frozen_string_literal: true

# Controller responsible for managing staff users in the admin section.
# This controller includes actions for listing, creating, updating, and deleting staff users.
class Admin::StaffUsersController < ApplicationController
  include AuthorizationHelper
  before_action :check_admin_role
  before_action :set_user, only: %i[edit update destroy active_staff_user]
  include UserStatusToggle
  def index
    @staffs = User.where(role: 'staff')
    respond_to do |format|
      format.html
      format.json { render json: StaffUserDatatable.new(params) }
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = build_new_user
    @user.role = 'staff'
    if @user.save
      flash[:notice] = 'User created successfully.'
      redirect_to admin_staff_users_path
    else
      flash[:alert] = 'Failed to create user.'
      render :new
    end
  end

  def active_staff_user
    toggle_user_status(@user)
    redirect_to admin_staff_users_path
  end

  def edit
    return if @user.present?

    flash[:alert] = 'User not found.'
    redirect_to admin_staff_users_path
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'User information updated successfully.'
      redirect_to admin_staff_users_path
    else
      flash[:alert] = 'Failed to update user information.'
      render :edit
    end
  end

  def destroy
    if @user == current_user
      flash[:alert] = 'admin cannot delete self.'
    elsif @user.update(removed: true)
      flash[:notice] = 'User deleted successfully.'
    else
      flash[:alert] = 'Failed to delete user.'
    end
    redirect_to admin_staff_users_path
  end

  def show; end

  private

  def build_new_user
    User.new(params.require(:user).permit(:email, :password, :username, :mobile_number,
                                          :address, :profession, :gender, :name, :image, :deleted))
  end

  def user_params
    params.require(:user).permit(:email, :username, :password, :mobile_number,
                                 :address, :profession, :gender, :name, :image, :deleted)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end
end
