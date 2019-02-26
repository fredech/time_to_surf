class Spot < ApplicationRecord
  has_many :sessions, dependent: :destroy
  has_many :spot_services
  has_many :services, through: :spot_services
  has_many :preferred_spots

  default_scope { order(step: :asc) }

  # mount_uploader :photo, PhotoUploader
  # validates_presence_of :photo
  # validates_integrity_of :photo
  # validates_processing_of :photo

  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_location?

  validates :address, presence: true
  validates :description, presence: true
  # validates :video, presence: true

  mount_uploader :photo, PhotoUploader

end
