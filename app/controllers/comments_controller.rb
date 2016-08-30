class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def new
    @user = current_user
    @comment = Comment.new
    @comment.user_id = @user.id
    @article = Article.find_by_id(params[:article_id])
  end

  def create
    @article = Article.find_by_id(params[:article_id])
    new_comment = Comment.new(comment_params)
    user_id = current_user[:id]
    new_comment[:user_id] = user_id
    @article.comments << new_comment
    if new_comment.save
    redirect_to show_article_path(@article)
    end
  end

  def edit
    @comment = Comment.find_by_id(params[:id])
    @article = Article.find_by_id(params[:article_id])
  end

  def update
    @comment = Comment.find_by_id(params[:id])
    @article = Article.find_by_id(params[:article_id])
    @comment.update(comment_params)
    redirect_to show_article_path(@article)
  end
  
  def destroy
    @comment = Comment.find_by_id(params[:id])
    @article = Article.find_by_id(params[:article_id])
    @comment.destroy
    redirect_to show_article_path
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end

end
