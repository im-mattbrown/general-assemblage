class ArticlesController < ApplicationController

  def index
    @articles = Article.all
    @q = Article.ransack(params[:q])
    @search = @q.result
  end

  def show
    @comment = Comment.find_by_id(params[:comment_id])
    @article = Article.find_by_id(params[:id])
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
    @article = Article.find_by_id(params[:id])
  end

  def update
    @article = Article.find_by_id(params[:id])
    @article.update(article_params)
    redirect_to articles_path
  end

  def destroy
    @article = Article.find_by_id(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :city, :article_type)
  end
end
