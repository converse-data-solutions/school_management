module UserToggle
  private

  def toggle_user_status(user)
    new_status = user.status == 'Active' ? 'Inactive' : 'Active'
    user.update(status: new_status)
    flash[:notice] = 'Status changed successfully.'
  end
end
