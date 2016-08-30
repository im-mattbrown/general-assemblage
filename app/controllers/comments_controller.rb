class CommentsController < ApplicationController

  before_action :logged_in?

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
      flash[:notice] = "Congratulations! Your comment was successfully posted."
    redirect_to show_article_path(@article)
    else
      flash[:notice] = "Please enter your comment."
      redirect_to article_comments_path
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
    flash[:notice] = "Your comment was successfully edited."
    redirect_to show_article_path(@article)
  end

  def destroy
    @comment = Comment.find_by_id(params[:id])
    @article = Article.find_by_id(params[:article_id])
    @comment.destroy
    flash[:notice] = "Your comment was successfully deleted."
    redirect_to show_article_path
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end

end
