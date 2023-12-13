module UserStatusToggle
  def toggle_user_status(user)
    new_status = user.deleted == 'Active' ? 'Inactive' : 'Active'
    user.update(deleted: new_status)
    flash[:notice] = 'Status changed successfully.'
  end
end
