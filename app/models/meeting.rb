class Meeting < ApplicationRecord
  validates :title, presence: true
  validates :startDateTime, presence: true
  validates :endDateTime, presence: true
end
