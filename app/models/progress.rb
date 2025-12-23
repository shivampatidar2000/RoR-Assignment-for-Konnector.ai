class Progress < ApplicationRecord
  belongs_to :user
  belongs_to :batch

  validates :score, numericality: { only_integer: true }, allow_nil: true
end
