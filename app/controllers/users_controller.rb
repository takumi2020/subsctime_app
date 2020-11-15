class UsersController < ApplicationController
  before_action :set_address, only: [:show, :edit]


  def show
  end

  def new
    @user = User.new
  end
  
  
end
