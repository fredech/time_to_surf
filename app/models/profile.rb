class Profile < ApplicationRecord
  belongs_to :user, dependant: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  LEVELS = %w(Beginner Intermediate Advanced Expert)

  validates :user, presence: true
  validates :level,
            presence: true,
            inclusion: { in: LEVELS, message: "Part of the list" }
end
