Rails.application.routes.draw do
  root 'calculator#new'
  get '/calculate', to: 'calculator#calculate'
end
