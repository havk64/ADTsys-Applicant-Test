Rails.application.routes.draw do
  root "home#index"

  get "/models" => "models#index"
end
