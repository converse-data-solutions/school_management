module AuthorizationHelper
  private

  def check_admin_role
    return if current_user && current_user.role == 'admin'

    flash[:alert] = 'You do not have permission to access this page.'
    redirect_to root_path
  end
end
