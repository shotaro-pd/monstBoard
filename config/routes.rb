Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
        resources :board do
            collection do
                get 'index'
                get 'rank'
            end
        end
    end
  end



  post '/callback' => 'linebot#callback'

end
