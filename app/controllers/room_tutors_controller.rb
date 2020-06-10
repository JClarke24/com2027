class RoomTutorsController < ApplicationController

  before_action :load_entities

  def index
    @room_tutors = RoomTutor.all
  end

  def new
    @room_tutor = RoomTutor.new
  end

  def create
    @room_tutor = RoomTutor.new permitted_parameters

    if @room_tutor.save
      flash[:success] = "Room #{@room_tutor.name} was created successfully"
      redirect_to room_tutors_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @room_tutor.update_attributes(permitted_parameters)
      flash[:success] = "Room #{@room_tutor.name} was updated successfully"
      redirect_to room_tutors_path
    else
      render :new
    end
  end

  def show
    @room_tutor_msg= RoomTutorMsg.new roomtutor_id: @room_tutor.id
    #@room_tutor_msgs = @room_tutor.room_tutor_msgs.includes(:tutor)
    roomtutor_id = @room_tutor.id
    @room_tutor_msgs = RoomTutorMsg.where("roomtutor_id = roomtutor_id")
  end


  protected

  def load_entities
    @room_tutors = RoomTutor.all
    @room_tutor = RoomTutor.find(params[:id]) if params[:id]
  end

  def permitted_parameters
    params.require(:room_tutor).permit(:name, :id)
  end

end
