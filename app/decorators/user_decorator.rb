class UserDecorator < ApplicationDecorator
  def link_to
    h.link_to object.username, h.edit_admin_parent_user_path(object)
  end

  def dt_actions
    links = []
    links << h.link_to('Status', h.admin_parent_user_path(object))
    links << h.link_to('Edit', h.edit_admin_parent_user_path(object))
    links << h.link_to('Delete', h.admin_parent_user_path(object), data: { turbo_method: :delete },
                                                                   remote: true)

    h.safe_join(links, '')
  end
end
