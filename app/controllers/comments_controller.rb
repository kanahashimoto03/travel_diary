class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/diaries/#{comment.diary.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, diary_id: params[:diary_id])
  end

end
