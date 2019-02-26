class Profile < ApplicationRecord
  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  LEVELS = ["1-Beginner", "2-Intermediate", "3-Advanced", "Expert")
  validates :name, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :author, presence: true
  validates :level,
            presence: true,
            inclusion: { in: LEVELS, message: "Part of the list" }
end
