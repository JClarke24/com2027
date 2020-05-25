class SubmissionsController < ApplicationController
  before_action :authenticate_student!, only: [:new, :create, :destroy]
  before_action :authenticate_tutor!, only: [:update, :edit]

  def index
    if student_signed_in?
        @submissions = Submission.student_submissions(current_student)
    elsif tutor_signed_in?
        @submissions = Submission.tutor_submissions(current_tutor)
    else
      redirect_to root_path
    end
  end

  def new
      @submission = Submission.new
  end

  def create
      cparams = submission_params
      cparams[:student_id] = current_student.id
      cparams[:tutor_id] = current_student.tutor_id
      @submission = Submission.new(cparams)
      if @submission.save
        redirect_to submissions_path, notice: "The submission #{@submission.description} has been uploaded."
      else
        render "new"
      end
  end

  def edit
    @submission = Submission.find(params[:id])
  end

  def update
    @submission = Submission.find(params[:id])
    cparams = submission_params
    if @submission.update(cparams)
      redirect_to submissions_path, notice: "The submission #{@submission.description} has been updated."
    else
      render "edit"
    end
  end

  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy
    redirect_to submissions_path, notice:  "The submission #{@submission.description} has been deleted."
  end

  private
    def submission_params
      params.require(:submission).permit(:student, :tutor, :description, :submission, :feedback)
    end
  end
