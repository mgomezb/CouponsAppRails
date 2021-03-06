Rails.application.routes.draw do
  resources :categories

  resources :notifications

  resources :locals do
    resources :beacons do
      member do
        put 'add_coupon_to_beacon', as: 'add_coupon_to'
        put 'remove_coupon_from_beacon', as: 'remove_coupon_from'
        put 'add_notification_to_beacon', as: 'add_notification_to'
        get 'add_notification', as: 'add_notification'
        put 'remove_notification_from_beacon', as: 'remove_notification_from'
      end
    end
    resources :notifications
    resources :stores do
      resources :coupons
    end

    resources :users

    member do
      put 'add_user_to_local', as: 'add_user_to'
      put 'remove_user_from_local', as: 'remove_user_from'
    end

  end

  devise_for :users, :controllers => { registrations: 'registrations' }

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'locals#index'

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

  #Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  namespace :api do
    namespace :v1 do
      devise_scope :user do
        post 'registrations' => 'registrations#create', :as => 'register'
        post 'sessions' => 'sessions#create', :as => 'login'
        delete 'sessions' => 'sessions#destroy', :as => 'logout'
      end

      resources :coupons, only: [:index] do
        member do
          put 'claim_coupon'
        end
      end

      resources :categories, only: [:index] do
      end
    end
  end

end
