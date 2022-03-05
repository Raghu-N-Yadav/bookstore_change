Rails.application.routes.draw do
  root to: "admins#index"

  get 'see', to: "registration#index"

  get "sign_up", to:"registration#new"

  post "sign_up", to: "registration#create"

  delete "logout", to: "sessions#destroy"

  get "sign_in", to:"sessions#new"

  post "sign_in", to: "sessions#create"

  get "see_books", to: "books_page#index"

  get "add_book", to: "books_page#new"
  post "add_book", to: "books_page#create"
  delete "delete_book", to: "books_page#destroy"

  get "issue_book", to: "book_issue#new"
  get "show_book", to: "book_issue#show"
  post "issue_book", to: "book_issue#create"

  get "return_book", to: "book_issue#return"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
