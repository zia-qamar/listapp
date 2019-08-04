Rails.application.routes.draw do
  root to: 'lists#index'
  resources :lists
  resources :list_items
  get '/restore' => 'trash#index'
  delete 'trash_list/:id' => 'lists#trashed', as: :list_trash
  get '/restore/:id' => 'trash#restore', as: :item_restore
end
