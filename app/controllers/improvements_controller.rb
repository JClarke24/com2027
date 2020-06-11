class ImprovementsController < ApplicationController
  before_action :authenticate_student!, only: [:new, :create, :destroy]
  before_action :authenticate_tutor!, only: [:update, :edit]
  # GET /improvements
  # GET /improvements.json
  def index
    if student_signed_in?
        @improvements = Improvement.student_improvements(current_student)
    elsif tutor_signed_in?
      @improvements = Improvement.tutor_improvements(current_tutor)

    else
      redirect_to root_path
    end
  end

  # GET /improvements/1
  # GET /improvements/1.json
  def show
  end

  # GET /improvements/new
  def new
    @improvement = Improvement.new
  end

  # GET /improvements/1/edit
  def edit
    @improvement = Improvement.find(params[:id])
  end

  # POST /improvements
  # POST /improvements.json
  def create
    cparams = improvement_params
    cparams[:student_id] = current_student.id
    cparams[:tutor_id] = current_student.tutor_id
    @improvement = Improvement.new(cparams)
    if @improvement.save
      redirect_to improvements_path, notice: "The improvement request #{@improvement.request} has been made."
    else
      render "new"
    end

  end

  # PATCH/PUT /improvements/1
  # PATCH/PUT /improvements/1.json
  def update
    @improvement = Improvement.find(params[:id])
    cparams = improvement_params
    if @improvement.update(cparams)
      redirect_to improvements_path, notice: "The improvement marks #{@improvement.request} has been updated."
    else
      render "edit"
    end
  end

  # DELETE /improvements/1
  # DELETE /improvements/1.json
  def destroy

    @improvement = Improvement.find(params[:id])
    @improvement.destroy
    redirect_to improvements_path, notice:  "The improvement request #{@improvement.request} has been deleted."

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_improvement
      @improvement = Improvement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def improvement_params
      params.require(:improvement).permit(:student, :tutor, :listening, :writing, :reading, :reading)
    end
end
