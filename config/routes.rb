Rails.application.routes.draw do
  root to: 'content_items#index'
  resources :content_items
  patch '/list/:id' => 'content_items#update', as: :list
  patch '/list_item/:id' => 'content_items#update', as: :list_item
  get '/restore' => 'trash#index'
  delete 'trash_list/:id' => 'content_items#trashed', as: :list_trash
  get '/restore/:id' => 'trash#restore', as: :item_restore
end
