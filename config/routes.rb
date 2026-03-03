Rails.application.routes.draw do
  devise_for :users

  root 'competitions#index'

  namespace :admin do
    get "submissions/edit"
    get "submissions/update"
    get "competitions/new"
    get "competitions/create"
    get "competitions/submissions"
    get "competitions/evaluate"
    resources :competitions, only: [:new, :create] do
      member do
        get 'submissions'   # show submissions for a competition
        post 'evaluate'     # AI evaluation trigger
      end
    end
    resources :submissions, only: [:edit, :update]
  end

  namespace :competitor do
    get "submissions/new"
    get "submissions/create"
    get "submissions/index"
    resources :submissions, only: [:new, :create]
    get 'my_results', to: 'submissions#index'
  end
end