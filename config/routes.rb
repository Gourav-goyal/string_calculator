Rails.application.routes.draw do
  root 'calculators#index'
  post '/add', to: 'calculators#add'
end
