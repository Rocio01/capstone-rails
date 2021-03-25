module GroupsHelper
  def delete_link(group)
    return unless group.user_id == current_user.id

    link_to 'delete', group, method: :delete,
                             data: { confirm: 'Are you sure?' }
  end
end
