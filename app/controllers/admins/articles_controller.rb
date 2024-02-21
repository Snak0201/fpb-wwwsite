module Admins
  class ArticlesController < DeviseAuthenticationController
    # https://qiita.com/ogomr/items/20822f0a2161af264969
    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    def index
      @articles = Article.admin_index.page(params[:page])
      authorize @articles
    end

    def show
      @article = Article.find(params[:id])
      authorize @article
    end

    def new
      @article = Article.new
      authorize @article
    end

    def edit
      @article = Article.find(params[:id])
      authorize @article
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

    def toggle_published
      @article = Article.find(params[:id])

      # NOTE: 投稿日時がnilなら非公開、時間が入っているなら公開
      if @article.published_at.nil?
        @article.update(published_at: Time.current)
      else
        @article.update(published_at: nil)
      end
      redirect_to admin_article_path(@article)
    end

    private

    def article_params
      params.require(:article).permit(%i[title content number], bureau_ids: [])
    end

    def user_not_authorized
      redirect_back fallback_location: root_path, alert: '権限がありません'
    end
  end
end
