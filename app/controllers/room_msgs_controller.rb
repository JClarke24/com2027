class RoomMsgsController < ApplicationController
  before_action :load_entities

  def create
    @room_msg = RoomMsg.create student: current_student,
                                room: @room,
                                message: params.dig(:room_msg, :message)

    RoomChannel.broadcast_to @room, @room_msg
  end

  protected

  def load_entities
    @room = Room.find params.dig(:room_msg, :room_id)
  end

end
