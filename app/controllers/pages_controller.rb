class PagesController < ApplicationController
  def top
    @articles = Article.newest
  end

  def about; end
  def links; end
end
