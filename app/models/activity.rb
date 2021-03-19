class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :group, optional: true
  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true, length: {maximum: 50}
  validates :activity_time, presence: true

end
