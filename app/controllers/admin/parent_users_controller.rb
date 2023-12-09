# Controller responsible for handling parent user actions in the admin section.
# This controller includes CRUD operations for managing parent user accounts.
class Admin::ParentUsersController < ApplicationController
  before_action :set_user, only: %i[edit update destroy active_user]

  def index
    respond_to do |format|
      format.html
      format.json { render json: ParentUserDatatable.new(params) }
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = build_new_user
    @user.role = 'parent'
    if User.exists?(username: @user.username)
      flash[:alert] = 'User already exists.'
      render :new
    elsif @user.save
      flash[:notice] = 'User created successfully.'
      redirect_to admin_parent_users_path
    end
  end

  def edit; end

  def update
    if @user.update(user_update)
      flash[:notice] = 'User information updated successfully.'
      redirect_to admin_parent_users_path
    else
      flash[:alert] = 'Failed to update user information.'
      render :edit
    end
  end

  def active_user
    toggle_user_status
    redirect_to admin_parent_users_path
  end

  def destroy
    if @user == current_user
      flash[:alert] = 'Admin cannot delete self.'
    else
      @user.destroy
      flash[:notice] = 'User deleted successfully.'
    end
    redirect_to admin_parent_users_path
  end

  private

  def build_new_user
    User.new(user_params)
  end

  def user_params
    params.require(:user).permit(:email, :username, :password, :mobile_number,
                                 :address, :profession, :gender, :name, :image, :deleted)
  end

  def user_update
    params.require(:user).permit(:email, :username, :encrypted_password, :mobile_number,
                                 :address, :profession, :gender, :name, :image, :deleted)
  end

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def toggle_user_status
    new_status = @user.deleted == 'Active' ? 'Inactive' : 'Active'
    @user.update(deleted: new_status)
    flash[:notice] = 'Status changed successfully.'
  end
end
