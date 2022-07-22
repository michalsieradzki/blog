class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  
  before_action :set_post
  before_action :set_comment, except: :create

  def create
    
    @comment = @post.comments.create(comment_params.merge(user_id: current_user.id))
    redirect_to post_path(@comment.post)
  end

  def destroy
   if @comment.delete
    flash[:notice] = "Komentarz usunięty pomyślnie"
   end
    redirect_to @post
  end

  
  private

  def comment_params
    params.require(:comment).permit(:body)
  end
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end