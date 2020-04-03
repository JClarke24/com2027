Rails.application.routes.draw do
  get 'tutor_profile/tutorProfile'
  devise_for :tutors, path: 'tutors', controllers: { sessions: "tutors/sessions"}
  devise_for :students, path: 'students', controllers: { sessions: "students/sessions"}

  authenticated :tutor do
    root 'tutors/dashboards#home', as: :authenticated_tutor_root
  end

  authenticated :student do
    root 'students/dashboards#home', as: :authenticated_student_root
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Home page is the root
  root 'home#home'

end
