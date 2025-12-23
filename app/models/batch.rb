class Batch < ApplicationRecord
  belongs_to :course

  has_many :enrollments
  has_many :students, through: :enrollments, source: :user
  has_many :progresses, dependent: :destroy

  validates :name, :start_date, :end_date, presence: true
end
