class ArticlesController < ApplicationController
  def index
    @articles = Article.newer.page(params[:page])
  end

  def show
    @article = Article.published.find(params[:id])
  end
end
