Rails.application.routes.draw do

  root    'session#new'

  get     'login'        =>  'session#new'
  post    'login'        =>  'session#create'
  delete  'logout'       =>  'session#destroy'
  get     'signup'       =>  'users#new'
  get     'search'       =>  'projects#search'
  get     'profile'      =>  'users#profile'

  get     'users/graph'
  get     'sales_channels/get_data' => 'sales_channels#get_data', :defaults => { :format => 'json' }


  resources :time_entries, except: [:new, :create] do
    collection do
      post  'clock_in'
      patch 'clock_out'
    end
  end
  resources :project_costs do
    collection do
      get 'search'
    end
  end
  resources :material_uses
  resources :material_purchases do
    collection do
      get 'search'
    end
  end
  resources :sales_channels do
    collection do
      get 'search'
    end
  end
  resources :business_expenses do
    collection do
      get 'search'
    end
  end
  resources :sales_goals
  resources :sales do
    collection do
      get 'search'
    end
  end
  resources :projects do
    collection do
      get 'search'
    end
  end
  resources :users do
    member do
      get 'dashboard'
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
