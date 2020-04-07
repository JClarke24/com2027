Rails.application.routes.draw do

  devise_for :tutors, path: 'tutors', controllers: { registrations: "tutors/registrations", sessions: "tutors/sessions"}
  devise_for :students, path: 'students', controllers: { registrations: "students/registrations", sessions: "students/sessions"}

  authenticated :tutor do
    root 'tutors/dashboards#home', as: :authenticated_tutor_root
    get 'profile', to: 'tutors/dashboards#profile', as: :authenticated_tutor_profile
    get 'quiz', to: 'tutors/quizzes#show'
  end

  authenticated :student do
    root 'students/dashboards#home', as: :authenticated_student_root
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Home page is the root
  root 'home#home'

end
