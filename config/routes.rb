Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



get "/enter_product" =>"products#enter_product"
post "/show_product" => "products#show_product"

#Index 
get "/products" => "products#index"

#New and Create
get "/products/new" => "products#new"
post "/products" => "products#create"

# Show 
get "/products/:id" => "products#show"

# Edit and Update 
get "/products/:id/edit" => "products#edit"
patch "/products/:id" => "products#update"

#Delete 
delete "products/:id" => "products#destroy"

end
