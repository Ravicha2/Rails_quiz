Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'static_pages#index'
  get '/job' => 'job#index'
  get '/job/:id' => 'job#type'
  post '/job', to: 'job#create'
end
