#ActionController::InvalidAuthenticityToken happens when a logged in Devise model
#(eg. User) logs in, in the same browser, as another Devise Model (eg. Admin)
#A technical issue with this type of setup, however, is that a signed in devise
#user will be able to access sign in and login pages of another devise user.
#This is definitely not a desired result.
#As a solution, a simple concern can be implemented

module Accessible
  extend ActiveSupport::Concern
  included do
    before_action :check_student, :check_tutor
  end

  protected
  def check_student
    if current_tutor
      flash.clear
      # if you have rails_tutor. You can redirect anywhere really
      redirect_to(rails_tutor.dashboard_path) and return
    elsif current_student
      flash.clear
      # The authenticated root path can be defined in your routes.rb in: devise_scope :student do...
      redirect_to(authenticated_student_root_path) and return
    end
  end

  protected
  def check_tutor
    if current_student
      flash.clear
      # if you have rails_student. You can redirect anywhere really
      redirect_to(rails_student.dashboard_path) and return
    elsif current_tutor
      flash.clear
      # The authenticated root path can be defined in your routes.rb in: devise_scope :tutors do...
      redirect_to(authenticated_tutor_root_path) and return
    end
  end
end
