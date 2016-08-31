class ArticlesController < ApplicationController
  include AuthHelper
  include ArticlesHelper

  before_action :logged_in?
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :assure_ownership!, only: [:edit, :update, :destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 15)
    @q = Article.ransack(params[:q])
    @q.sorts = 'created_at desc' if @q.sorts.empty?
    @search = @q.result.paginate(page: params[:page], per_page: 15)
  end

  def show
    @comment = Comment.find_by_id(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = session[:user_id]
    if @article.save
      flash[:notice] = "Congratulations! Your article was successfully posted."
      redirect_to articles_path
    else
        flash[:notice] = "Sorry, please try again.There are some issues:  #{@article.errors.full_messages.join(', ')}."
      redirect_to new_article_path
    end
  end

  def edit
  end

  def update
    if auth_through_article
      if @article.update(article_params)
    flash[:notice] = "Your article was successfully edited."
    redirect_to user_path(current_user)
      else
        render :edit
      end
    else
      auth_fail("not authorized to update that", articles_path)
    end
  end

  def destroy
    if auth_through_article
      @article.comments.destroy_all
      @article.destroy
      flash[:notice] = "Your article was successfully deleted."
      redirect_to user_path(@article.user_id)
    else
      auth_fail("not authorized to delete that", articles_path)
    end
  end

  private

  def current_user_is_op?
    current_user.id == @article.user_id
  end

  def assure_ownership!
    auth_fail("U ain't slick smh", articles_path) unless current_user_is_op?
  end

  def article_params
    params.require(:article).permit(:title, :content, :city, :article_type)
  end
end
