class UserDecorator < ApplicationDecorator
  def link_to
    h.link_to object.username, h.edit_admin_parent_user_path(object)
  end

  def dt_actions
    links = []
    links << h.link_to('Status', h.active_user_admin_parent_user_path(object), data: { turbo_method: :patch },
                                                                               remote: true)
    links << h.link_to('Edit', h.edit_admin_parent_user_path(object))
    links << h.link_to('Delete', h.admin_parent_user_path(object), data: {
                                                                     turbo_method: :delete,
                                                                     turbo_confirm: 'Are you sure?'
                                                                   },
                                                                   remote: true)

    h.safe_join(links, '')
  end
end
