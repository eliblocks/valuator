Rails.application.routes.draw do
  root 'calculator#new_basic_valuation'
  get 'calculator/profit', to: 'calculator#profit'
  get 'calculator/basic_valuation', to: 'calculator#basic_valuation'
end
