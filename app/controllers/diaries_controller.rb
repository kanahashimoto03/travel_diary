class DiariesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :search_diary, only: [:index, :search]

  def index
    @diary = Diary.all
    set_diary_column
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
    @comment = Comment.new
    @comments = @diary.comments.includes(:user)
  end

  def search
    @results = @q.result
  end

  def edit
    @diary = Diary.find(params[:id])
  end

  def update
    diary = Diary.find(params[:id])
    if diary.update(diary_params)
      redirect_to root_path 
    end
  end


  def destroy
    diary = Diary.find(params[:id])
    if diary.destroy
      redirect_to root_path
    end
  end

  private
  def diary_params
    params.require(:diary).permit(:image, :country_id, :city, :category_id, :date, :recommendations, :things_to_avoide, :things_to_bring).merge(user_id: current_user.id)
  end

  private 
  def search_diary
    @q = Diary.ransack(params[:q])
  end

  def set_diary_column
    @country_name = Diary.select("country_id").distinct
    @category_name = Diary.select("category_id").distinct
  end

end