class PreferredSpot < ApplicationRecord
  belongs_to :spot
  belongs_to :user

  validates :spot_id, presence: true, null: false
  validates :user_id, presence: true, null: false
end
