class User < ApplicationRecord
  # extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # association
  has_many :surf_sessions
  has_many :preferred_spots
  has_one :profile, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  # validations
  validates :pseudo, presence: true
  validates_presence_of :photo
  validates_integrity_of :photo
  validates_processing_of :photo

end
