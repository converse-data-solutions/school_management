class StandardDecorator < ApplicationDecorator
  delegate :name

  def link_to
    h.link_to object.name
  end
  def standard_actions
    links = []
   
    links << h.link_to(h.content_tag(:i, nil, class: 'fas fa-edit') + ' Edit'.html_safe,
                       h.edit_standard_path(object), class: 'standard_edit')
    links << h.link_to(h.content_tag(:i, nil, class: 'fas fa-trash-alt') + ' Delete'.html_safe,
                       h.standard_path(object), data: { turbo_method: :delete, turbo_confirm: 'Are you sure?' }, remote: true, class: 'standard_delete')

    h.safe_join(links, '')
  end
end
