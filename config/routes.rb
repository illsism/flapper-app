Rails.application.routes.draw do
  root to: 'application#angular'

  resources :posts, only: [:create, :index, :show] do
    resources :comments, only: [:show, :create] do
      member do
        put '/upvote' => 'comments#upvote'
        put '/downvote' => 'comments#downvote'
      end
    end

    member do
      put '/upvote' => 'posts#upvote'
      put 'downvote' => 'posts#downvote'
    end
  end
end
