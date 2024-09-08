class BureausController < ApplicationController
  def show
    @bureau = Bureau.find_by!(slug: params[:slug])
    @articles = @bureau.articles.published.page(params[:page]).per(10)
    @committees = @bureau.committees.sorted
    puts @committees.present?
  end
end
