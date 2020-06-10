class RoomTutorMsgsController < ApplicationController
  before_action :load_entities

  def create
    @room_tutor_msg = RoomTutorMsg.create tutor: current_tutor,
                                          roomtutor_id: params.dig(:room_tutor_msg, :room_tutor),
                                          message: params.dig(:room_tutor_msg, :message)

    RoomTutorChannel.broadcast_to @room_tutor, @room_tutor_msg
  end

  protected

  def load_entities
    puts("PARAMS: " + params.to_s)
    @tutorid = params.dig(:room_tutor_msg, :room_tutor)
    #@room_tutor = RoomTutor.find(@tutorid)
    puts(@tutorid)
  end
end
