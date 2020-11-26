Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      # api test action
      resources :board, only:[:index]
    end
  end



  #post '/callback' => 'linebot#callback'

end
