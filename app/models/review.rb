class Review < ApplicationRecord
  #association
  belongs_to :surf_session

  RATES = %w(0 1 2 3 4 5)
  validates :content, presence: true
  validates :facilities, presence: true
  validates :condition, presence: true
  validates :access, presence: true
  validates :surf_session_id, presence: true

  mount_uploader :photo, PhotoUploader

   #validation
  validates_presence_of :photo
  validates_integrity_of :photo
  validates_processing_of :photo

  def weighted_average
    (condition * 0.5 + access * 0.25 + facilities * 0.25).round
  end

  #validates :rating,
  #         presence: true,
  #         inclusion: { in: RATES, message: "Please choose a rating between 0 to 5" }
end
