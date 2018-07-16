class Tweet < ApplicationRecord
  validates_length_of :description, maximum: 140

  belongs_to :user
  has_many :replies, dependent: :destroy

  # 「tweet被很多使用者喜歡」的多對多關係
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  def is_liked?(user)
    self.likes.include?(user)
  end
end

