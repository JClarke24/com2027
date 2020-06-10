require "google/apis/calendar_v3"
require "google/api_client/client_secrets.rb"


class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]
  CALENDAR_ID = 'primary'

  # GET /meetings
  # GET /meetings.json
  def index
    if current_tutor
      @meetings = current_tutor.meetings
    elsif current_student
      @meetings = Tutor.find(current_student.tutor_id).meetings
    end
  end



  # GET /meetings/1
  # GET /meetings/1.json
  def show
    if current_student
      client = get_google_calendar_client current_student
      meeting = params[:meeting]
      event = get_event meeting
      client.insert_event('primary', event)
      flash[:notice] = 'Meeting was successfully added.'
      redirect_to meetings_path
    elsif current_tutor
      #client = get_google_calendar_client current_tutor
      #meeting = params[:meeting]
      #event = get_event meeting
      #client.insert_event('primary', event)
      #flash[:notice] = 'Meeting was successfully added.'
      # redirect_to meetings_path
    end
  end

  def get_google_calendar_client current_student
    client = Google::Apis::CalendarV3::CalendarService.new
    return unless (current_student.present? && current_student.access_token.present? && current_student.refresh_token.present?)
    secrets = Google::APIClient::ClientSecrets.new({
      "web" => {
          "access_token" => current_student.access_token,
          "refresh_token" => current_student.refresh_token,
          "client_id" => ENV["GOOGLE_CLIENT_ID"],
          "client_secret" => ENV["GOOGLE_CLIENT_SECRET"]
      }
    })
    begin
      client.authorization = secrets.to_authorization
      client.authorization.grant_type = "refresh_token"

      if !current_student.present?
        client.authorization.refresh!
        current_user.update_attributes(
          access_token: client.authorization.access_token,
          refresh_token: client.authorization.refresh_token,
          expires_at: client.authorization.expires_at.to_i
        )
      end
    rescue => e
      flash[:error] = 'Your token has expired. Please login to google again.'
      redirect_to :back
    end
    client
  end



  # GET /meetings/new
  def new
    # @meeting = Meeting.new
    @meeting = current_tutor.meetings.new
    # @tutor_id = current_tutor.id
  end

  # GET /meetings/1/edit
  def edit

  end


  # POST /meetings
  # POST /meetings.json
  def create
    # @meeting = Meeting.new(meeting_params)
    @meeting = current_tutor.meetings.create(meeting_params)

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to @meeting, notice: 'Meeting was successfully created.' }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: 'Meeting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    def get_event meeting
      # attendees
      event = Google::Apis::CalendarV3::Event.new({
        summary: 'meeting[:title]',
        location: 'To be implemented',
        description: 'meeting[:description]',
        start: {
          date_time: "2020-06-28T09:00:00-07:00"
          # date_time: Time.new(meeting['startDateTime(1i)'],meeting['startDateTime(2i)'],meeting['startDateTime(3i)'],meeting['startDateTime(4i)'],meeting['startDateTime(5i)']).to_datetime.rfc3339
        },
        end: {
          date_time: "2020-06-28T09:00:00-10:00"
          #date_time: Time.new(meeting['endDateTime(1i)'],meeting['endDateTime(2i)'],meeting['endDateTime(3i)'],meeting['endDateTime(4i)'],meeting['endDateTime(5i)']).to_datetime.rfc3339
        },
        # attendees,
        reminders: {
          use_default: false,
          overrides: [
            Google::Apis::CalendarV3::EventReminder.new(reminder_method:"popup", minutes: 10),
            Google::Apis::CalendarV3::EventReminder.new(reminder_method:"email", minutes: 20)
          ]
        },
        notification_settings: {
          notifications: [
              {type: 'event_creation', method: 'email'},
              {type: 'event_change', method: 'email'},
              {type: 'event_cancellation', method: 'email'},
              {type: 'event_response', method: 'email'}
          ]
        }, 'primary': true
        })
      end


    # Only allow a list of trusted parameters through.
    def meeting_params
      params.require(:meeting).permit(:title, :description, :tutor_id, :student_id, :location, :startDateTime, :endDateTime, :student_accepted)
    end
end
