class RoomTutorMsg < ApplicationRecord
  belongs_to :room_tutor, inverse_of: :room_tutor_msgs
  belongs_to :tutor
end
