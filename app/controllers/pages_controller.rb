class PagesController < ApplicationController
  def top
    @announcement = ::Admins::Announcement.last
    @articles = Article.newest
  end

  def about; end
  def links; end
end
