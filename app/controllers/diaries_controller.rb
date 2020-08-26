class DiariesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @diary = Diary.all
  end
  
  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.save
      redirect_to :root
    else  
      render :new 
    end
  end

  def show
    @diary = Diary.find(params[:id])
  end


  private
  def diary_params
    params.require(:diary).permit(:image, :country_id, :city, :category_id, :date, :recommendations, :things_to_avoide, :things_to_bring).merge(user_id: current_user.id)
  end

end