# frozen_string_literal: true

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  include DeviseTokenAuth::Concerns::User

  has_many :marks
  has_many :mark_drafts
  has_many :favorites
  has_many :comments
  has_many :clips

  has_many :follower, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy # フォローする人取得
  has_many :followed, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy # フォローされる人取得
  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人

  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy

  has_one_attached :file

  validates :self_intro, length: { maximum: 60 }

  # ユーザーをフォローする、後ほどcontrollerで使用
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外す、後ほどcontrollerで使用
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォローしていればtrueを返す、後ほどviewで使用
  def following?(user)
    following_user.include?(user)
  end

  def name
    file.filename.to_s
  end

  def path
    return '' unless file.attached?

    Rails.application.routes.url_helpers.rails_storage_proxy_path(file, only_path: true)
  end

  def content_type
    return '' unless file.attached?

    file.content_type
  end

  def create_notification_follow!(current_user)
    temp = Notification.where(['visitor_id = ? and visited_id = ? and action = ? ', current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end
end
