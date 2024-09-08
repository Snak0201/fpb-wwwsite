class PagesController < ApplicationController
  def top
    @announcement = ::Admins::Announcement.last
    @articles = Article.newest
    @bureaus = Bureau.all
    @committees = Committee.sorted.eager_load(:bureau)
  end

  def about; end
  def links; end
end
