module AuthorizationParentHelper
  private

  def check_user_role
    return if current_user && current_user.role == 'parent'

    flash[:alert] = 'You do not have permission to access this page.'
    redirect_to root_path
  end
end
