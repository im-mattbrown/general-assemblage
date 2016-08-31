class CommentsController < ApplicationController

  include ArticlesHelper
  include AuthHelper

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
    @comment = Comment.new(comment_params)
    @comment[:user_id] = current_user[:id]
    @article.comments << @comment
    if @comment.save
      flash[:notice] = "Congratulations! Your comment was successfully posted."
    redirect_to show_article_path(@article)
    else
      flash[:notice] = "Please enter your comment."
      redirect_to article_comments_path
    end
  end

  def edit
    comment_ownership!
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

  def comment_params
    params.require(:comment).permit(:content)
  end

  def current_user_is_op?
    current_user.id == @comment.user_id
  end

  def comment_ownership!
    flash[:bruh] = true
    auth_fail("U ain't slick smh", articles_path) unless current_user_is_op?
  end

end
