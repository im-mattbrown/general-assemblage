class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:article_id])
  end

  def edit
    @article = Article.find(params[:article_id])
  end

  def update
    @article = Article.find(params[:article_id])
    @article.update(article_params)
  end

  def destroy
    @article = Post.find(params[:post_id])
    @article.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:article).permit(:title, :content, :city, :article_type)
  end
end
