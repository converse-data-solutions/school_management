class AcademicDetailDecorator < ApplicationDecorator
  delegate_all

  def link_to
    h.link_to object.id
  end

  def academic_action
    links = []
    links << h.link_to(h.content_tag(:i, nil, class: 'fas fa-edit') + ' Edit'.html_safe,
                       h.edit_academic_detail_path(object), class: 'student_edit')
    links << h.link_to(h.content_tag(:i, nil, class: 'fas fa-trash-alt') + ' Delete'.html_safe,
                       h.academic_detail_path(object), data: { turbo_method: :delete, turbo_confirm: 'Are you sure?' }, remote: true, class: 'student_delete')
    h.safe_join(links, '')
  end
end
