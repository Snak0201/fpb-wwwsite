class ArticlesController < ApplicationController
  def index
    @articles = Article.newer
  end

  def show
    @article = Article.published.find(params[:id])
  end
end
