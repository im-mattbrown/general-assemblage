class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:article_id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article .new(article _params)
    @article .user_id = session[:user_id]
    if @article.save
      @user.articles.push(@article )
      redirect_to @user
    else
      redirect_to new_article_path
    end
  end

  def edit
    @article = Article.find(params[:article_id])
  end

  def update
    @article = Article.find(params[:article_id])
    @article.update(article_params)
  end

  def destroy
    @article = Article.find(params[:post_id])
    @article.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:article).permit(:title, :content, :city, :article_type)
  end
end
