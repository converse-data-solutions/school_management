module UserStatusToggle
  extend ActiveSupport::Concern

  def toggle_user_status
    new_status = @student.deleted == 'Active' ? 'Inactive' : 'Active'
    @student.update(deleted: new_status)
    flash[:notice] = 'Status changed successfully.'
  end
end
