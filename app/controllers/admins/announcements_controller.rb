module Admins
  class AnnouncementsController < DeviseAuthenticationController
    def new
      @announcement = Announcement.new
    end

    def create
      @announcement = Announcement.new(announcement_params)

      if params[:commit] == 'キャンセル'
        render :new, status: :see_other
      elsif params[:commit] == '更新'
        if @announcement.save
          redirect_to admin_index_path, notice: 'お知らせを更新しました。'
        else
          render :new, status: :unprocessable_entity
        end
      end
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
