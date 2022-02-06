# frozen_string_literal: true

class Mark < ApplicationRecord
  belongs_to :movie, optional: true
  belongs_to :user, optional: true
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :score,
            numericality: { greater_than_or_equal_to: 0.1, less_than_or_equal_to: 5.0 },
            presence: true
  validates :content, length: { maximum: 500 }
  validates :movie_id, presence: true, uniqueness: { scope: :user_id }

  def create_notification_favo!(current_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(['visitor_id = ? and visited_id = ? and mark_id = ? and action = ? ', current_user.id,
                               user_id, id, 'favo'])
    # いいねされていない場合のみ、通知レコードを作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        mark_id: id,
        visited_id: user_id,
        action: 'favo'
      )
      # 自分の投稿に対するいいねの場合は、通知済みとする
      notification.checked = true if notification.visitor_id == notification.visited_id
      notification.save if notification.valid?
    end
  end

  def create_notification_comment!(current_user, comment_id)
    # 自分以外にコメントしている人をすべて取得し、全員に通知を送る
    temp_ids = Comment.select(:user_id).where(mark_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      mark_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    # 自分の投稿に対するコメントの場合は、通知済みとする
    notification.checked = true if notification.visitor_id == notification.visited_id
    notification.save if notification.valid?
  end
end
