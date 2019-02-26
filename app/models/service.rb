class Service < ApplicationRecord
  has many :spots, through: :spots_services

  validates :name, presence: true
end
