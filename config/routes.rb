Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
        resources :board do
            get 'rank', on: :collection
        end
    end
  end



  post '/callback' => 'linebot#callback'

end
