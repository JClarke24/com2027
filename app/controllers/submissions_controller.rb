class SubmissionsController < ApplicationController
  #before_action :authenticate_tutor!
  before_action :authenticate_student!, only: [ :edit, :update, :destroy]

  def index
    if student_signed_in?
        @submissions = Submission.student_submissions(current_student)
    else
        @submissions = Submission.tutor_submissions(current_tutor)
    end
  end

  def new
      @submission = Submission.new
  end

  def create
    if student_signed_in?
       cparams = submission_params
       cparams[:student_id] = current_student.id
       cparams[:tutor_id] = current_student.tutor_id
       @submission = Submission.new(cparams)
       if @submission.save
          redirect_to submissions_path, notice: "The submission #{@submission.description} has been uploaded."
       else
          render "new"
       end
    else
        cparams = submission_params
        cparams[:tutor_id] = current_tutor.id
        @submission = Submission.new(cparams)
        if @submission.save
           redirect_to submissions_path, notice: "The submission #{@submission.description} has been uploaded."
        else
           render "new"
        end
      end
    end

  def submission
    stud = params[:student_id]
    submission_params[:student_id] = stud
  end



    #f @submission.save
    #   redirect_to submissions_path, notice: "The submission #{@submission.description} has been uploaded."
    #else
    #   render "new"
    #end

  #end


    def destroy
       @submission = Submission.find(params[:id])
       @submission.destroy
       redirect_to submissions_path, notice:  "The submission #{@submission.description} has been deleted."
    end

    private
       def submission_params
         params.require(:submission).permit(:student, :tutor_id, :description, :attachment2)
       end
    end
