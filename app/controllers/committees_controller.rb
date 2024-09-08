class CommitteesController < ApplicationController
  def show
    @committee = Committee.find_by!(slug: params[:slug])
    @articles = @committee.articles.published.page(params[:page]).per(10)
  end
end
