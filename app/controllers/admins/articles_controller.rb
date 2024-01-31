class Admins::ArticlesController < ApplicationController
  def index
    @articles = Article.order(:id)
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    article = Article.new(create_article_params)
    puts article.valid?
  end

  def update
  end

  private
  def create_article_params
    params.require(:article).permit(%i[title content number])
  end
end
