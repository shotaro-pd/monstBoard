Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
        resources :board, only:[:index, :rank]
    end
  end



  post '/callback' => 'linebot#callback'

end
