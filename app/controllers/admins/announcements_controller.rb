module Admins
  class AnnouncementsController < DeviseAuthenticationController
    def new
      @announcement = Announcement.new
    end

    def create
      Rails.logger.debug params
      redirect_to new_admin_announcement_path
    end

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
