class StudentDecorator < ApplicationDecorator
  delegate_all

  def link_to
    h.link_to object.admission_no
  end

  def check_box
    h.check_box_tag 'students[]', object.id
  end

  def student_status
    links = []
    links << if object.status == 'Active'
               h.link_to('Active'.html_safe,
                         h.students_path, class: 'status-active')
             else
               h.link_to('Inactive'.html_safe,
                         h.students_path, class: 'status-inactive')
             end
    h.safe_join(links, '')
  end
  
  def student_actions
    links = []
    if object.status == 'Active'
      links << h.link_to(h.content_tag(:i, nil, class: 'fas fa-trash-alt') + ' Deactive'.html_safe,
                         h.active_student_student_path(object), data: { turbo_method: :patch, turbo_confirm: 'Are you sure You Want To Deactivate?' }, remote: true, class: 'student_deactive')
      links << h.link_to(h.content_tag(:i, nil, class: 'fas fa-edit') + ' Edit'.html_safe,
                         h.edit_student_path(object), class: 'student_edit')
    else
      links << h.link_to(h.content_tag(:i, nil, class: 'fas fa-trash-alt') + ' Active'.html_safe,
                         h.active_student_student_path(object), data: { turbo_method: :patch, turbo_confirm: 'Are you sure You Want To Activate?' }, remote: true, class: 'student_active')
    end

    links << h.link_to(h.content_tag(:i, nil, class: 'fas fa-trash-alt') + ' Delete'.html_safe,
                       h.student_path(object), data: { turbo_method: :delete, turbo_confirm: 'Are you sure You Want To Delete?' }, remote: true, class: 'student_delete')
    h.safe_join(links, '')
  end
end
