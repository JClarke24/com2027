# frozen_string_literal: true

class Tutors::SessionsController < Devise::SessionsController
  include Accessible_tutor
  skip_before_action :check_tutor, only: :destroy
  # before_action :configure_sign_in_params, only: [:create]
  def after_sign_in_path_for(resource)
      if resource.banned?
        sign_out resource
        flash[:error] = "This account has been banned for: " + resource.flag_reason.to_s + ". You are unable to access the account."
        root_path
      elsif resource.warned?
        flash[:error] = "This account has been warned for: " + resource.flag_reason.to_s+ ". If you receive another warning, you will be banned."
        sign_in resource
        super
      else
        super
      end
     end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
