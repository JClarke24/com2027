class Tutors::DashboardsController < ApplicationController
  include Accessible_tutor
  before_action :authenticate_tutor!
  before_action :check_approval

  def home
    if current_tutor
      @language = current_tutor.language
      @location = current_tutor.location
      @forename = current_tutor.forename
      @surname = current_tutor.surname
      @description = current_tutor.description
    end
  end

  def profile
  end

  def setLocationSubmit
    location = params[:location]
    current_tutor.location = location
    current_tutor.save
    redirect_to authenticated_tutor_root_url
  end

  def setInfo
    @language = current_tutor.language
    @forename = current_tutor.forename
    @surname = current_tutor.surname
    @description = current_tutor.description
  end

  def updateInfo
    if current_tutor
    @language = current_tutor.language
    @forename = current_tutor.forename
    @surname = current_tutor.surname
    @description = current_tutor.description
    forename = params[:forename]
    surname = params[:surname]
    language = params[:language]
    description = params[:description]
    current_tutor.forename = forename
    current_tutor.surname = surname
    current_tutor.language = language
    current_tutor.description = description
    current_tutor.save
    redirect_to authenticated_tutor_root_url
    end
  end

  def acceptStudent
    student_id = params[:student_id]
    @student = Student.find(student_id)
    @student.tutor_confirmed = true
    @student.save
    redirect_to dashboard_url
  end

  def rejectStudent
    student_id = params[:student_id]
    @student = Student.find(student_id)
    @student.tutor_id = nil
    @student.save
    redirect_to authenticated_tutor_root_url
  end

  def messages
  end

  private

  def check_approval
    if current_tutor.unapproved?
      flash[:notice] = "Pass the test to become an approved tutor"
      redirect_to(quiz_path)
    end
  end

end
