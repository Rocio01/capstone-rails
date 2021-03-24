class Group < ApplicationRecord
  has_many :activities, dependent: :destroy
  belongs_to :user
  default_scope -> { order(name: :asc).limit(20) }
  validates :name, presence: true, length: { maximum: 50 }
  validates :icon, presence: true
  validates :user_id, presence: true
end
