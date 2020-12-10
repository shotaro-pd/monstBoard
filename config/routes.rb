Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :board, only:[:index]
      namespace :board do
          resources :ranking, only[:rank]
      end
    end
  end



  post '/callback' => 'linebot#callback'

end
