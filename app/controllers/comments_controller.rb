class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    @user = current_user
    @comment = Comment.new
    @comment.user_id = @user.id
    @article = Article.find_by_id(params[:id])
  end

  def create
    logged_in?
    article = Article.find_by_id(params[:id])
    new_comment = Comment.new(comment_params)
    user_id = current_user[:id]
    new_comment[:user_id] = user_id
    article.comments << new_comment
    if new_comment.save
    redirect_to show_article_path
    end
  end


  private
    def comment_params
      params.require(:comment).permit(:content)
    end

end
