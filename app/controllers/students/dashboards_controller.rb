class Students::DashboardsController < ApplicationController
  include Accessible_student
  
  def home
    if current_student
      @language = current_student.language
      @tutor = Tutor.find(current_student.tutor_id)
      @tutor_confirmed = current_student.tutor_confirmed
    end
    
  rescue ActiveRecord::RecordNotFound
    current_student.tutor_id = nil
    current_student.tutor_confirmed = false
    current_student.save
  end

  def profile
  end
  
  def pickLanguage
    lang = params[:lang]
    current_student.language = lang
    current_student.save
    redirect_to authenticated_student_root_url
  end
  
  def requestTutor
    tutor_id = params[:tutor_id]
    current_student.tutor_id = tutor_id
    current_student.tutor_confirmed = false
    current_student.save!
    redirect_to authenticated_student_root_url
  end

end
