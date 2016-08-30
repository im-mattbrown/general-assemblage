class ArticlesController < ApplicationController
before_action :logged_in?

  def index
    @articles = Article.paginate(page: params[:page], per_page: 15)
    @q = Article.ransack(params[:q])
    @q.sorts = 'created_at desc' if @q.sorts.empty?
    @search = @q.result.paginate(page: params[:page], per_page: 15)
  end

  def show
    @comment = Comment.find_by_id(params[:id])
    @article = Article.find_by_id(params[:article_id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = session[:user_id]
    if @article.save
      redirect_to articles_path
    else
      redirect_to new_article_path
    end
  end

  def edit
    @article = Article.find_by_id(params[:article_id])
  end

  def update
    @article = Article.find_by_id(params[:article_id])
    @article.update(article_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @article = Article.find_by_id(params[:article_id])
    @article.comments.destroy_all
    @article.destroy
    redirect_to user_path(@article.user_id)
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :city, :article_type)
  end
end
