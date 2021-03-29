class Activity < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :groups
  default_scope -> { order(created_at: :desc).includes(:user).limit(20) }
  validates :name, presence: true, length: { maximum: 50 }
  validates :activity_time, presence: true
end
