Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
        post '/board' => 'board#index'
        post '/ranking' => 'board#rank'
        # resources :board, only:[:index]
        # resources :ranking, only[:rank]
    end
  end



  post '/callback' => 'linebot#callback'

end
