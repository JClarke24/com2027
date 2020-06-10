class Meeting < ApplicationRecord
  validates :title, presence: true
  validates :startDateTime, presence: true
  validates :endDateTime, presence: true

  #has_one :student
  #has_one :tutor
  #belongs_to :tutor
end
