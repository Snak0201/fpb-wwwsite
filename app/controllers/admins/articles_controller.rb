module Admins
  class ArticlesController < ApplicationController
    before_action :authenticate_admin!

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
      @article = Article.find(params[:id])
    end

    def create
      @article = Article.new(article_params)

      if @article.save
        redirect_to admin_articles_path, notice: '記事が登録されました'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      @article = Article.find(params[:id])

      if @article.update(article_params)
        redirect_to admin_article_path(@article), notice: '記事が更新されました'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @article = Article.find(params[:id])

      if @article.destroy
        redirect_to admin_articles_path, notice: '記事が削除されました'
      else
        render :show, status: :unprocessable_entity
      end
    end

    private

    def article_params
      params.require(:article).permit(%i[title content number])
    end
  end
end
