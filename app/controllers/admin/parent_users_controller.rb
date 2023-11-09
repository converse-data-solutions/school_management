class Admin::ParentUsersController < ApplicationController
  def index
    @parents = User.where(role: 'parent')
    gon.parent = @parents
    respond_to do |format|
      format.html
      format.json { render json: ParentUserDatatable.new(params, view_context:) }
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = build_new_user

    if User.exists?(username: @user.username)
      flash[:alert] = 'User already exists.'
      render :new
    elsif @user.save

      flash[:notice] = 'user created successfully.'
      redirect_to root_path
    end
  end

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

  def destroy
    user = User.find_by(id: params[:id])
    if user == current_user
      flash[:alert] = 'admin cannot delete self.'
    else
      user.destroy
      flash[:notice] = 'User deleted successfully.'
    end
    redirect_to root_path
  end

  private

  def build_new_user
    User.new(params.require(:user).permit(:email, :password, :username, :role, :mobile_number,
                                          :address, :profession, :gender, :name, :avatar))
  end

  def user_params
    params.require(:user).permit(:email, :username, :password, :role, :mobile_number,
      :address, :profession, :gender, :name, :avatar)
  end
end
