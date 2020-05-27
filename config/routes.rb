Rails.application.routes.draw do


  devise_for :admins
  resources :submissions
  resources :quizzes, only: [:index, :new, :create, :destroy]

  devise_for :tutors, path: 'tutors', controllers: { registrations: "tutors/registrations", sessions: "tutors/sessions"}
  devise_for :students, path: 'students', controllers: { registrations: "students/registrations", sessions: "students/sessions"}

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

    get 'tutortest', to: 'tutors/quizzes#tutortest', as: :tutor_sign_up_test
    get 'tutortest/english', to: 'tutors/quizzes#english', as: :tutor_english_test
    get 'tutortest/spanish', to: 'tutors/quizzes#spanish', as: :tutor_spanish_test
    get 'tutortest/german', to: 'tutors/quizzes#german', as: :tutor_german_test
    get 'tutortest/french', to: 'tutors/quizzes#french', as: :tutor_french_test
    get 'tutortest/success', to: 'tutors/quizzes#success', as: :tutor_success

  end

  authenticated :student do
    root 'students/dashboards#home', as: :authenticated_student_root
    get 'profile', to: 'students/dashboards#profile', as: :authenticated_student_profile

    post 'pickLanguage', to: 'students/dashboards#pickLanguage'
    post 'requestTutor', to: 'students/dashboards#requestTutor'
    get 'findTutor', to: 'students/dashboards#maps'
    get 'quizzes', to: 'quizzes#index'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Home page is the root
  root 'home#home'

end
