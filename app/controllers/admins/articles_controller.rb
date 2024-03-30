module Admins
  class ArticlesController < DeviseAuthenticationController
    def index
      @articles = Article.admin_index.page(params[:page])
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

      if params[:commit] == 'キャンセル'
        @article.assign_attributes(article_params)
        render :edit, status: :see_other
      elsif params[:commit] == '更新'
        if @article.update(article_params)
          redirect_to admin_article_path(@article), notice: '記事が更新されました'
        else
          render :edit, status: :unprocessable_entity
        end
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

    def preview
      @article = Article.find(params[:id])
      # NOTE: プレビューで公開日時を正しく表示する
      @article.assign_attributes(article_params)
      @update_target_article = Article.find(params[:id])
      render :preview, status: :see_other
    end

    def restore_previous_version
      @article = Article.find(params[:id])

      # NOTE: 1バージョンのみ復元できる
      if @article.paper_trail.previous_version&.save
        redirect_to admin_article_path(@article), notice: '記事を復元しました'
      else
        redirect_to admin_article_path(@article), alert: '記事を復元できませんでした'
      end
    end

    private

    def article_params
      params.require(:article).permit(:title, :content, :number, bureau_ids: [])
    end
  end
end
