PushvendorPos::Application.routes.draw do

  get 'expenses/new'
#  get 'expenses'
  get 'expenses/edit'
  resources :expenses
  resources :item_categories

  resources :reports do
    collection do
      get 'total_report'
      get 'date_range_report'
      get 'customer_report'
      get 'item_report'
    end
  end

  resources :line_items

  resources :payments do
    collection do
      get 'make_payment'
    end
  end

  resources :configurations do 
    collection do 
      get 'update'
    end
  end

  resources :customers

  resources :items do
    get 'search'
    collection do
      get 'search'
    end
  end

  resources :sales do
    collection do
      get 'update_line_item_options'
      get 'update_customer_options'
      get 'create_line_item'
      get 'update_totals'
      get 'add_item'
      get 'remove_item'
      get 'create_customer_association'
      get 'create_custom_item'
      get 'create_custom_customer'
      get 'add_comment'
      post 'override_price'
      post 'sale_discount'
    end
  end

  resources :dashboard do
    collection do
      get 'create_sale_with_product'
    end
  end

  devise_for :users
  resources :users do
    collection do
      post 'new_user'
    end
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'dashboard#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
