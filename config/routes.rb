Rails.application.routes.draw do
  
  namespace :api do

    #sessions
    post "/sessions" => "sessions#create"

    #messages
    post "/messages" => "messages#create"

    #users
    get "/users/:id" => "users#show"
    post "/users" => "users#create"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"


    #conversations

    get "/conversations" => "conversations#index"
    get "/conversations/:id" => "conversations#show"
    post "conversations" => "conversations#create"


    #goals
    get "/goals" => "goals#index"
    get "/goals/:id" => "goals#show"
    post "/goals" => "goals#create"
    patch "/goals/:id" => "goals#update"
    delete "goals/:id" => "goals#destroy"

  end

  get "/*path" => proc { [200, {}, [ActionView::Base.new.render(file: 'public/index.html')]] }
end
