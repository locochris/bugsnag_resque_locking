Rails.application.routes.draw do
  root to: 'visitors#index'

  ResqueWeb::Engine.eager_load!
  mount ResqueWeb::Engine => "/resque_web"
end
