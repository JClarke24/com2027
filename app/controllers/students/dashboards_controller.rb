class Students::DashboardsController < ApplicationController
  include Accessible_student

  def home
    if current_student
      @language = current_student.language
      @tutor = Tutor.find(current_student.tutor_id)
      @student = current_student
      @tutor_confirmed = current_student.tutor_confirmed
    end

  rescue ActiveRecord::RecordNotFound
    #in case the tutor has deleted their account
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

  def rateTutor
    tutor = Tutor.find(current_student.tutor_id)
    rating = params[:tutor_rating].to_i
    current_rating_tutor = tutor.rating.to_f
    num_rates = tutor.num_rates.to_i
    if current_student.rated?
      new_rating = (current_rating_tutor + rating - current_student.current_rating)/(num_rates)
      tutor.rating = new_rating
      tutor.num_rates = num_rates
      current_student.current_rating = rating
      current_student.save!
    else
      new_rating = (current_rating_tutor + rating)/(num_rates+1)
      tutor.rating = new_rating
      tutor.num_rates = num_rates + 1
      current_student.current_rating = rating
      current_student.rated = true
      current_student.save!
    end
    tutor.save!
    redirect_to authenticated_student_root_url
  end
end
