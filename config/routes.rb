Rails.application.routes.draw do
  # get "/", to: "welcome#root"
  namespace :api, default:{format:"json"} do
    namespace :v1 do
      resources :users do
      end
    end
  end
end
