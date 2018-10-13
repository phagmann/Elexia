Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :menus  
  get 'addition', to: 'tools#addition'
  get 'subtraction', to: 'tools#subtraction'
  get 'definition', to: 'tools#definition'
  get 'student_grade', to: 'grades#student_grade'
  #devise_for :users
  resources :subjects, only: [:new, :create, :update]
  resources :books, only: [:new, :create, :show, :update]
  resources :sections, only: [:new, :create, :update]
  resources :chapters, only: [:new, :create, :show, :update]
  resources :lessons, only: [:new, :create, :show, :update]
  resources :enrollments, only: [:index, :create]
  resources :notes, only: [:new]
  resources :grades, only: [:index]
  resources :downloads, only: :index, format: 'docx'
  root 'menus#index'
end
