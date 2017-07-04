Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'

  get 'about', to: 'pages#about', as: :about
  get 'conference', to: 'pages#conference', as: :conference
  get 'download_report', to: 'pages#download_report', as: :download_report
  get 'survey', to: 'pages#survey', as: :survey

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
