module Admins
  class AnnouncementsController < DeviseAuthenticationController
    def edit
      @announcement = Announcement.last
    end

    def update; end

    def preview; end
  end
end
