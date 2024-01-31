module Admins
  class ArticlesController < ApplicationController
    def index
      @articles = Article.order(:id)
    end

    def show
      @article = Article.find(params[:id])
    end

    def new
      @article = Article.new
    end

    def edit; end

    def create
      @article = Article.new(create_article_params)

      if @article.valid?
        redirect_to admin_articles_path, notice: '記事が登録されました'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update; end

    private

    def create_article_params
      params.require(:article).permit(%i[title content number])
    end
  end
end
