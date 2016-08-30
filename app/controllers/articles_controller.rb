class ArticlesController < ApplicationController
  before_action :logged_in?
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 15)
    @q = Article.ransack(params[:q])
    @q.sorts = 'created_at desc' if @q.sorts.empty?
    @search = @q.result
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
      redirect_to user_path(current_user)
    else
      redirect_to new_article_path
    end
  end

  def edit
    
  end

  def update
    
    @article.update(article_params)
    redirect_to user_path(current_user)
  end

  def destroy
    
    @article.comments.destroy_all
    @article.destroy
    redirect_to user_path(@article.user_id)
  end

  private
  
  def find_article
    @article = Article.find_by_id(params[:article_id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :city, :article_type)
  end
end
