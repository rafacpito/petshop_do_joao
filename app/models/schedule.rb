class Schedule < ApplicationRecord
  belongs_to :service

  validates :owner_name, :phone, :owner_email, :date, :hour, presence: true
end
