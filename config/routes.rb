Rails.application.routes.draw do
  post '/add', to: 'calculators#add'
end
