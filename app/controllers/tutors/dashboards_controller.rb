class Tutors::DashboardsController < ApplicationController
  include Accessible_tutor
  before_action :authenticate_tutor!
  before_action :check_approval

  def home
  end

  def profile
  end

  private

  def check_approval
    if current_tutor.unapproved?
      flash[:notice] = "Pass the test to become an approved tutor"
      redirect_to(quiz_path)
    end
  end
end
