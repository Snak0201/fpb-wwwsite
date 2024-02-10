module Admins
  class AnnouncementsController < DeviseAuthenticationController
    def new
      @announcement = Announcement.new
    end

    def create; end

    def preview
      @announcement = Announcement.new(announcement_params)
      render :preview, status: :see_other
    end

    private

    def announcement_params
      params.require(:admins_announcement).permit(:content)
    end

  end
end
