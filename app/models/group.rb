class Group < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :activities
  default_scope -> { order(name: :asc).includes(:user).limit(20) }
  validates :name, presence: true, length: { maximum: 50 }
  validates :icon, presence: true
  validates :user_id, presence: true
end
