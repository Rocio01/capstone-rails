class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :group, optional: true
  validates :name, presence: true, length: {maximum: 50}
  validates :activity_time, presence: true
  validates :user, presence: true
end
