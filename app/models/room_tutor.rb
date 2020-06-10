class RoomTutor < ApplicationRecord
  has_many :room_tutor_msgs, dependent: :destroy, inverse_of: :room_tutor
end
