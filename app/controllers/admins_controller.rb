class AdminsController < ApplicationController
  def index
    @books = Book.all
  end
   
end
