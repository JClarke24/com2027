class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_tutor!, only: [:show, :edit, :update, :destroy]


  def index
    if tutor_signed_in?
      @quizzes = Quiz.tutor_quizzes(current_tutor)
    else
      @quizzes = Quiz.all
    end
  end

  def new
    @quiz = Quiz.new
  end

  def create
      cparams = quiz_params
      cparams[:tutor_id] = current_tutor.id
      @quiz = Quiz.new(cparams)

      if @quiz.save
        redirect_to quizzes_path, notice: "The quiz #{@quiz.topic} has been uploaded."
      else
        render "new"

      end
  end

  def destroy
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    redirect_to quizzes_path, notice:  "The quiz  #{@quiz.topic} has been deleted."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_params
      params.require(:quiz).permit( :language, :topic, :level, :attachment, :tutor_id)
    end
  end
