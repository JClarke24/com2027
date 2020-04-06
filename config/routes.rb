Rails.application.routes.draw do
  devise_for :tutors, path: 'tutors', controllers: { sessions: "tutors/sessions"}
  devise_for :students, path: 'students', controllers: { sessions: "students/sessions"}

  authenticated :tutor do
    root 'tutors/dashboards#home', as: :authenticated_tutor_root
    get 'dashboard', to: 'tutors/dashboards#home'
  end

  authenticated :student do
    root 'students/dashboards#home', as: :authenticated_student_root
    post 'pickLanguage', to: 'students/dashboards#pickLanguage'
    get 'dashboard', to: 'students/dashboards#home'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Home page is the root
  root 'home#home'

end
