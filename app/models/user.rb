class User < ApplicationRecord
  has_secure_password
  enum :role, [ :admin, :school_admin, :student ]
  has_many :schools, foreign_key: :school_admin_id, dependent: :destroy
  has_many :enrollments, dependent: :destroy
  has_many :progresses, dependent: :destroy
  has_many :batches, through: :enrollments

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :role, presence: true
end
