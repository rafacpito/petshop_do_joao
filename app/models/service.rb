class Service < ApplicationRecord
  has_many :schedules
  mount_uploader :image, ImageUploader

  validates :name, :description, :value, :image, presence: true

end
