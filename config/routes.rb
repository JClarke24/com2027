Rails.application.routes.draw do

  resources :meetings
  devise_for :tutors, path: 'tutors', controllers: { registrations: "tutors/registrations", sessions: "tutors/sessions"}
  devise_for :students, path: 'students', controllers: { registrations: "students/registrations", sessions: "students/sessions", :omniauth_callbacks => 'callbacks'}

  authenticated :tutor do
    root 'tutors/dashboards#home', as: :authenticated_tutor_root
    get 'profile', to: 'tutors/dashboards#profile', as: :authenticated_tutor_profile
    get 'quiz', to: 'tutors/quizzes#show'

    get 'setLocation', to: 'tutors/dashboards#setLocation'
    post 'setLocation', to: 'tutors/dashboards#setLocationSubmit'
    get 'setInfo', to: 'tutors/dashboards#setInfo'
    post 'setInfo', to: 'tutors/dashboards#updateInfo'
    post 'acceptStudent', to: 'tutors/dashboards#acceptStudent'
    post 'rejectStudent', to: 'tutors/dashboards#rejectStudent'
    post 'messages', to: 'tutors/dashboards#messages'

    get 'schedule', to: 'tutors/dashboards#schedule'

  end

  authenticated :student do
    root 'students/dashboards#home', as: :authenticated_student_root
    get 'profile', to: 'students/dashboards#profile', as: :authenticated_student_profile

    post 'pickLanguage', to: 'students/dashboards#pickLanguage'
    post 'requestTutor', to: 'students/dashboards#requestTutor'
    get 'findTutor', to: 'students/dashboards#maps'
    get 'student_schedule', to: 'students/dashboards#student_schedule'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Home page is the root
  root 'home#home'

end
