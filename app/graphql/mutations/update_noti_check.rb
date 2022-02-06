# frozen_string_literal: true

module Mutations
  class UpdateNotiCheck < BaseMutation
    field :notifications, [Types::NotificationType], null: true
    # temp = Notification.where(['visitor_id = ? and visited_id = ? and mark_id = ? and action = ? ', current_user.id,
    #   user_id, id, 'favo'])
    argument :ids, [ID], required: true
    def resolve(**args)
      noti = Notification.where(id: args[:ids])
      noti.update_all(checked: true)
      {
        notifications: noti
      }
    end
  end
end
