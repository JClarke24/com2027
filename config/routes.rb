Rails.application.routes.draw do

  get 'student_profile/studentProfile'
  devise_for :tutors, path: 'tutors', controllers: { sessions: "tutors/sessions"}
  devise_for :students, path: 'students', controllers: { sessions: "students/sessions"}

  authenticated :tutor do
    root 'tutors/dashboards#home', as: :authenticated_tutor_root
    get 'profile', to: 'tutors/dashboards#profile', as: :authenticated_tutor_profile
  end

  authenticated :student do
    root 'students/dashboards#home', as: :authenticated_student_root
    get 'profile', to: 'students/dashboards#profile', as: :authenticated_student_profile
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Home page is the root
  root 'home#home'

end
