class Tutors::DashboardsController < ApplicationController
  before_action :authenticate_tutor!
  before_action :check_approval

  def home
  end

  def profile
  end

  private

  def check_approval
    if current_tutor.unapproved?
      flash[:notice] = "Access Denied - Pass the test to become an approved tutor"
      redirect_to(quiz_path)
    elsif current_tutor.approved?
      flash[:notce] = "Hello "
    end
  end
end
