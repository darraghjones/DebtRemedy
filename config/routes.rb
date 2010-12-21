DebtRemedy::Application.routes.draw do
  root :to => redirect("/session/new")
  
  get "session/new"
  post "session/new", :to => "session#create", :as => "login"

  get "session/qaq"
  post "session/qaq", :to => "session#qaq_submit"

  get "session/welcome_back"
  get "session/self_employed"
  get "session/web_number"

  get "session/about_you"
  put "session/about_you", :to => "session#about_you_submit"

  get "session/your_income"
  put "session/your_income", :to => "session#your_income_submit"

  get "session/priority"
  put "session/priority", :to => "session#priority_submit"

  get "session/other_expenses"
  put "session/other_expenses", :to => "session#other_expenses_submit"

  get "session/living_expenses"
  put "session/living_expenses", :to => "session#living_expenses_submit"

  get "session/assets"
  put "session/assets", :to => "session#assets_submit"

  get "session/who_you_owe"
  put "session/who_you_owe", :to => "session#who_you_owe_submit"

  get "session/last_not_least"
  put "session/last_not_least", :to => "session#last_not_least_submit"

  get "session/please_wait"

  get "session/recommendation"

  get "session/remedy"

  get "session/email_booklet"

  get "session/your_details"

  get "session/logout"

  get "session/closure"

  post "session/logout", :to => "session#send_feedback"

  resources :client_answers

  resources :data_items

  resources :clients

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
