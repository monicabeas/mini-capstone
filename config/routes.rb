Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: "products#index"

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

#Search 
post "/search" => "products#search"


#Index Suppliers 
get "/suppliers" => "suppliers#index"

#New and Create Suppliers 
get "/suppliers/new" => "suppliers#new"
post "/suppliers" => "suppliers#create"

#Show Suppliers 
get "/suppliers/:id" => "suppliers#show"

# Edit and Update Suppliers 
get "/suppliers/:id/edit" => "suppliers#edit"
patch "/suppliers/:id" => "suppliers#update"

#Delete Supplier 
delete "suppliers/:id" => "suppliers#destroy"

#New and Create Images 
get "/products/:product_id/images/new" => "images#new"
post "/products/:product_id/images" => "images#create"

#Signup  
get "/signup" => "users#new"
post "/users" => "users#create"

#Log in 
get "/login" => "sessions#new"
post "/login" => "sessions#create"

#Log out 
get "/logout" => "sessions#destroy"





end
