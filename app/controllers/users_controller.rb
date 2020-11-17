class UsersController < ApplicationController
  before_action :set_address, only: [:show, :edit]


  def show
    @ = .find()
  end
  
  end

  def new
    @user = User.new
  end
  
  
end
