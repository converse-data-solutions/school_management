class UserDecorator < ApplicationDecorator
  delegate_all
  def link_to
    h.link_to object.username, class: 'user_link'
  end

  def staff_status
    links = []
    links << if object.status == 'Active'

               h.link_to('Active'.html_safe,
                         h.admin_staff_users_path, class: 'status-active')
             else
               h.link_to('Inactive'.html_safe,
                         h.admin_staff_users_path, class: 'status-inactive')

             end
    h.safe_join(links, '')
  end

  def user_status
    links = []
    links << if object.status == 'Active'

               h.link_to('Active'.html_safe,
                         h.admin_parent_users_path, class: 'status-active')
             else
               h.link_to('Inactive'.html_safe,
                         h.admin_parent_users_path, class: 'status-inactive')

             end
    h.safe_join(links, '')
  end

  def dt_actions
    links = []
    if object.status == 'Active'
      links << h.link_to(h.content_tag(:i, nil, class: 'fas fa-trash-alt') + ' Deactive'.html_safe,
                         h.active_user_admin_parent_user_path(object), data: { turbo_method: :patch, turbo_confirm: 'Are you sure You Want To Deactivate?' }, remote: true, class: 'parent_user_deactive')
    else
      links << h.link_to(h.content_tag(:i, nil, class: 'fas fa-trash-alt') + ' Active'.html_safe,
                         h.active_user_admin_parent_user_path(object), data: { turbo_method: :patch, turbo_confirm: 'Are you sure You Want To Activate?' }, remote: true, class: 'parent_user_active')
    end
    links << h.link_to(h.content_tag(:i, nil, class: 'fas fa-edit') + ' Edit'.html_safe,
                       h.edit_admin_parent_user_path(object), class: 'parent_user_edit')
    links << h.link_to(h.content_tag(:i, nil, class: 'fas fa-trash-alt') + ' Delete'.html_safe,
                       h.admin_parent_user_path(object), data: { turbo_method: :delete, turbo_confirm: 'Are you sure You Want To Delete?' }, remote: true, class: 'parent_user_delete')

    h.safe_join(links, '')
  end

  def staff_actions
    links = []
    if object.status == 'Active'
      links << h.link_to(h.content_tag(:i, nil, class: 'fas fa-trash-alt') + ' Deactive'.html_safe,
                         h.active_staff_user_admin_staff_user_path(object), data: { turbo_method: :patch, turbo_confirm: 'Are you sure You Want To Deactivate?' }, remote: true, class: 'parent_user_deactive')
    else
      links << h.link_to(h.content_tag(:i, nil, class: 'fas fa-trash-alt') + ' Active'.html_safe,
                         h.active_staff_user_admin_staff_user_path(object), data: { turbo_method: :patch, turbo_confirm: 'Are you sure You Want To Activate?' }, remote: true, class: 'parent_user_active')
    end
    links << h.link_to(h.content_tag(:i, nil, class: 'fas fa-edit') + ' Edit'.html_safe,
                       h.edit_admin_staff_user_path(object), class: 'parent_user_edit')
    links << h.link_to(h.content_tag(:i, nil, class: 'fas fa-trash-alt') + ' Delete'.html_safe,
                       h.admin_staff_user_path(object), data: { turbo_method: :delete, turbo_confirm: 'Are you sure You Want To Delete?' }, remote: true, class: 'parent_user_delete')

    h.safe_join(links, '')
  end
end
