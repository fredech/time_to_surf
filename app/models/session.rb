class Session < ApplicationRecord
  belongs_to :spot
  belongs_to :user
  has_many :reviews

  validates :start_time, presence: true
  validates :end_time, presence: true
end
