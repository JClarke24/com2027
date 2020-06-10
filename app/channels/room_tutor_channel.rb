class RoomTutorChannel < ApplicationCable::Channel
  def subscribed
    room = RoomTutor.find params[:room]
    stream_for room
  end
end
