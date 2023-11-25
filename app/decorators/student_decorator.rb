class StudentDecorator < ApplicationDecorator
  delegate_all

  def link_to
    h.link_to object.admission_no
  end

  def student_status
    links = []
    links << if object.deleted == 'Active'
               h.link_to('Active'.html_safe,
                         h.admin_students_path, class: 'status-active')
             else
               h.link_to('Inactive'.html_safe,
                         h.admin_students_path, class: 'status-inactive')

             end
    h.safe_join(links, '')

end


  def student_actions
    links = []
    if object.deleted == 'Active'
      links << h.link_to(h.content_tag(:i, nil, class: 'fas fa-trash-alt') + 'Deactive'.html_safe,
                         h.active_student_student_path(object), data: { turbo_method: :patch, turbo_confirm: 'Are you sure You Want To Deactivate?' }, remote: true, class: 'parent-user_deactive')
    else
      links << h.link_to(h.content_tag(:i, nil, class: 'fas fa-trash-alt') + 'Active'.html_safe,
                         h.active_student_student_path(object), data: { turbo_method: :patch, turbo_confirm: 'Are you sure You Want To Activate?' }, remote: true, class: 'parent_user_active')
    end
    links << h.link_to(h.content_tag(:i, nil, class: 'fas fa-edit') + ' Edit'.html_safe,
                       h.edit_admin_student_path(object), class: 'student_edit')
    links << h.link_to(h.content_tag(:i, nil, class: 'fas fa-trash-alt') + ' Delete'.html_safe,
                       h.student_path(object), data: { turbo_method: :delete, turbo_confirm: 'Are you sure?' }, remote: true, class: 'parent_user_delete')
   h.safe_join(links, '')

  end
end