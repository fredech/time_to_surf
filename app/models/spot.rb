class Spot < ApplicationRecord
  has_many :surf_sessions, dependent: :destroy
  has_many :spot_services
  has_many :services, through: :spot_services
  has_many :preferred_spots
  has_many :reviews, through: :surf_sessions

  default_scope { order(name: :asc) }

  mount_uploader :photo, PhotoUploader
  # mount_uploader :video, VideoUploader

  validates_presence_of :photo
  validates_integrity_of :photo
  validates_processing_of :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :photo, presence: true
  validates :seabed, presence: true
  validates :best_tide, presence: true
  validates :difficulty_level, presence: true
  # validates :video, presence: true
end
