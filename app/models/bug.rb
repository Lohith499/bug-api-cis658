class Bug < ApplicationRecord
  enum issue_type: [:issue, :enhancement, :feature]
  enum priority: [:low, :medium, :high]
  enum status: [:open, :closed, :monitor]
  validates :title, presence: true, length: {minimum: 5, maximum: 80}
  validates :description, presence: true, length: {minimum: 20, maximum: 600}
  validates :issue_type, presence: true
  validates :priority, presence: true
  validates :status, presence: true
  belongs_to :user
end
