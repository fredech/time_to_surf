class Service < ApplicationRecord
  has_many :spots, through: :spots_services

  validates :name, presence: true
end
