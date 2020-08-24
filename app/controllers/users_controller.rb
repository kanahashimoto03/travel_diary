class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(configure_permitted_parameters)
    @user.save
  end

  def destroy
  end

end
