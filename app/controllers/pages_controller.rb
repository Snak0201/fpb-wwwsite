class PagesController < ApplicationController
  def top
    @announcement = ::Admins::Announcement.last
    @articles = Article.newest
    @bureaus = Bureau.all
  end

  def about; end
  def links; end
end
