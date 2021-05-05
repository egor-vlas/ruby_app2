Rails.application.routes.draw do
  
  get 'tasks/index'
  get 'tasks/new'
  get 'welcome/index'
  root 'welcome#index'
  resources :tasks
end
