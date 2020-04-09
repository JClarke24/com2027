Rails.application.routes.draw do
  devise_for :tutors, path: 'tutors', controllers: { sessions: "tutors/sessions"}
  devise_for :students, path: 'students', controllers: { sessions: "students/sessions"}

  authenticated :tutor do
    root 'tutors/dashboards#home', as: :authenticated_tutor_root
    get 'dashboard', to: 'tutors/dashboards#home'
    get 'setLocation', to: 'tutors/dashboards#setLocation'
    post 'setLocation', to: 'tutors/dashboards#setLocationSubmit'
  end

  authenticated :student do
    root 'students/dashboards#home', as: :authenticated_student_root
    post 'pickLanguage', to: 'students/dashboards#pickLanguage'
    post 'requestTutor', to: 'students/dashboards#requestTutor'
    get 'dashboard', to: 'students/dashboards#home'
    get 'findTutor', to: 'students/dashboards#maps'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Home page is the root
  root 'home#home'

  #redirect user to login if they try to access dashboard without authentication
  get 'dashboard', to: 'home#home'

end
