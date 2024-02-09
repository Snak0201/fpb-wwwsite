module Admins
  class AnnouncementsController < DeviseAuthenticationController
    def edit
      @announcement = Announcement.last
    end

    def update; end

    def preview
      @announcement = Announcement.new(announcement_params)
      render :preview, status: :see_other
    end

    def announcement_params
      params.require(:admins_announcement).permit(:content)
    end
  end
end
