Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :top do
    get 'confirmed', to: 'covid_observations#confirmed', format: 'json'
  end

end
