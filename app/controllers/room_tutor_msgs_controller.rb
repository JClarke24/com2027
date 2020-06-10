class RoomTutorMsgsController < ApplicationController
  before_action :load_entities

  def create
    @room_tutor_msg = RoomTutorMsg.create tutor: current_tutor,
                                room_tutor: @room_tutor,
                                message: params.dig(:room_tutor_msg, :message)

    RoomTutorChannel.broadcast_to @room_tutor, @room_tutor_msg
  end

  protected

  def load_entities
    @room_tutor = RoomTutor.find params.dig(:room_tutor_msg, :room_tutor_id)
  end
end
