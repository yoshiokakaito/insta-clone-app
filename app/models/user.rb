class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower          
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :active_notifications, class_name: "Notification",
                                  foreign_key: "visitor_id",
                                  dependent: :destroy
  has_many :passive_notifications, class_name: "Notification",
                                  foreign_key: "visited_id",
                                  dependent: :destroy
  before_save { self.email = email.downcase }
  validates :user_name,  presence: true, length: { maximum: 50 }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  
  def feed
    Micropost.where("user_id IN (?) OR user_id = ?", following_ids, id)
  end
  
  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    following.include?(other_user)
  end
  
  def self.search(search)
    if search
      where(['user_name LIKE ?', "%#{search}%"]) 
    else
      all 
    end
  end
  
  def create_notification_follow!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and action = ? ",
                               current_user.id, id, 'follow'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        visited_id: id,
        action: 'follow'
      )
      notification.save if notification.valid?
    end
  end
  
end
