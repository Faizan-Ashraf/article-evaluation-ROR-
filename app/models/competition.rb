class Competition < ApplicationRecord
  belongs_to :created_by, class_name: 'User'
  has_many :submissions, dependent: :destroy

  scope :active, -> { where(is_active: true) }
end
