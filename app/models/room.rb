class Room < ApplicationRecord
  has_many :room_msgs, dependent: :destroy, inverse_of: :room
end
