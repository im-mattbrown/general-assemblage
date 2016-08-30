module ArticlesHelper
    
  def find_article
    @article = Article.find_by_id(params[:article_id])
  end
  
end
