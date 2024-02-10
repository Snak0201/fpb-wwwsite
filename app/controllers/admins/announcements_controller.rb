module Admins
  class AnnouncementsController < DeviseAuthenticationController
    def new
      @announcement = Announcement.new
    end

    def create; end

    def preview; end
  end
end
