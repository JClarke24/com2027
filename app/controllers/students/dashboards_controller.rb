class Students::DashboardsController < ApplicationController
  def home
    if current_student
      @language = current_student.language
    end
  end

  def pickLanguage
    lang = params[:lang]
    current_student.language = lang
    current_student.save
  redirect_to authenticated_student_root_url
end
def requestTutor
  @tutor_id = params[:tutor_id]
  current_student.tutor_id = @tutor_id
  current_student.save
  redirect_to authenticated_student_root_url
end

end
