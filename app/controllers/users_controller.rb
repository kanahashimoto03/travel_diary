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


  def show
    @user = User.find(params[:id]) 
    @diary = Diary.where(user_id: current_user.id)
  end

  

end
