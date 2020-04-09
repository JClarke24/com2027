class Tutors::DashboardsController < ApplicationController
  def home
    if current_tutor
      @language = current_tutor.language
      @location = current_tutor.location
    end
  end
  def setLocationSubmit
    location = params[:location]
    current_tutor.location = location
    current_tutor.save
    redirect_to authenticated_tutor_root_url
  end
end
