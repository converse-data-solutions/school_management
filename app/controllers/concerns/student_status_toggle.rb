module StudentStatusToggle
  private

  def toggle_student_status(user)
    new_status = user.status == 'Active' ? 'Inactive' : 'Active'
    user.update(status: new_status)
    flash[:notice] = 'Status changed successfully.'
  end
end
