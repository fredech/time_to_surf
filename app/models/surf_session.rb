class SurfSession < ApplicationRecord
  belongs_to :spot
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :start_time, presence: true
  validates :spot_id, presence: true, null: false
  validates :user_id, presence: true, null: false
end
