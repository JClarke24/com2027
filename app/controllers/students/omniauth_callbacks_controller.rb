# frozen_string_literal: true

class Students::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include Accessible_student
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  def google_oauth2
    @student = Student.from_omniauth(request.env["omniauth.auth"])
    if @student.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      auth = request.env["omniauth.auth"]
      @student.access_token = auth.credentials.token
      @student.expires_at = auth.credentials.expires_at
      @student.refresh_token = auth.credentials.refresh_token
      @student.save!
      sign_in(@student)
      redirect_to meetings_path
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
