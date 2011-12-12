Takeone::Application.routes.draw do
  resources :holidays, :except => :index

  resources :requests, :except => :index

  resources :shifts


  
  root :to => "splash#index"

  match "/manager" => "shifts#manager"


  match "/shifts/shift_taken/:id" => "shifts#shift_taken"

end
