#ActionController::InvalidAuthenticityToken happens when a logged in Devise model (eg. User) logs in, in the same browser, as another Devise Model (eg. Admin)
#A technical issue with this type of setup, however, is that a signed in devise user will be able to access sign in and login pages of another devise user. This is definitely not a desired result.
#As a solution, a simple concern can be implemented.

module Accessible_tutor
  extend ActiveSupport::Concern
  included do
    before_action :check_tutor
  end

  protected
  def check_tutor
    if current_student
      flash.clear
      # Redirects student to his dashboard page.
      redirect_to(authenticated_student_root_path) and return
    end
  end
end
