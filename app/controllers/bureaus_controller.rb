class BureausController < ApplicationController
  def show
    @bureau = Bureau.find_by!(slug: params[:slug])
    @articles = @bureau.articles.page(params[:page]).per(10)
  end
end
