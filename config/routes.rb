Rails.application.routes.draw do
  devise_for :tutors, path: 'tutors', controllers: { sessions: "tutors/sessions"}
  devise_for :students, path: 'students', controllers: { sessions: "students/sessions"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Home page is the root
  root 'home#home'

end
