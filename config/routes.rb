Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'

  get 'about', to: 'pages#about', as: :about
  get 'conference', to: 'pages#conference', as: :conference

  post 'proposals/:id/upvote', to: 'proposals#upvote', as: :upvote_proposal

  resources :interviews
  resources :insights

  namespace :admin do
    root 'base#home'
    resources :interviews
    resources :insights
    resources :proposals
  end
end
