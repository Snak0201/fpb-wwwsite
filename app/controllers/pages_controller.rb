class PagesController < ApplicationController
  def top
    @articles = Article.newest
    @announcement = Admins::Announcement.last
  end

  def about; end
  def links; end
end
