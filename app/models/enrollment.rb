class Enrollment < ApplicationRecord
  enum :status, [ :pending, :approved, :rejected ]

  belongs_to :user
  belongs_to :batch

  validates :user_id, uniqueness: { scope: :batch_id }
end
