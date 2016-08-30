class CommentsController < ApplicationController

  before_action :logged_in?
  before_action :find_article, except: [:index]
  before_action :find_comment, only: [:edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def new
    @user = current_user
    @comment = Comment.new
    @comment.user_id = @user.id
  end

  def create
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
  end

  def update
    @comment.update(comment_params)
    flash[:notice] = "Your comment was successfully edited."
    redirect_to show_article_path(@article)
  end

  def destroy
    @comment.destroy
    flash[:notice] = "Your comment was successfully deleted."
    redirect_to show_article_path
  end

  private
  
  def find_comment
    @comment = Comment.find_by_id(params[:id])
  end
  
  def find_article
    @article = Article.find_by_id(params[:article_id])
  end
  
  def comment_params
    params.require(:comment).permit(:content)
  end

end
