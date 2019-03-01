class Review < ApplicationRecord
  #association
  belongs_to :surf_session

  RATES = %w(0 1 2 3 4 5)
  validates :content, presence: true
  validates :surf_session_id, presence: true

  mount_uploader :photo, PhotoUploader

   #validation
  validates_presence_of :photo
  validates_integrity_of :photo
  validates_processing_of :photo

  #validates :rating,
  #         presence: true,
  #         inclusion: { in: RATES, message: "Please choose a rating between 0 to 5" }
end
