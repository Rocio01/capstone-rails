class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :group, optional: true
  validates :name, presence: true, length: {maximum: 50}
  validates :tiempo, presence: true
  validates :user_id, presence: true
  
end
