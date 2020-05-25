class Tutors::QuizzesController < SubmissionsController < ApplicationController
  include Accessible_tutor
  before_action :authenticate_tutor!


  #def submission
  #  stud = params[:student_id]
  #  submission_params[:student_id] = stud
  #  cparams = submission_params
  #  cparams[:tutor_id] = current_tutor.id
  #  @submission = Submission.new(cparams)
  #  if @submission.save
  #     redirect_to submissions_path, notice: "The submission #{@submission.description} has been uploaded."
  #  else
  #     render "new"
  #  end
  #end
