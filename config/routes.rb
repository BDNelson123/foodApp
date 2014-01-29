Food::Application.routes.draw do
  devise_for :users ,:controllers => { :registrations => "registrations" }

  resources :test
end
