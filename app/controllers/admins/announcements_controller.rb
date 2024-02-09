module Admins
  class AnnouncementsController < DeviseAuthenticationController
    def edit
      # NOTE: キャンセルボタンが押された場合
      @announcement = if params[:admins_announcement]
                        Announcement.new(announcement_params)
                      else
                        Announcement.last
                      end
    end

    def update
      @announcement = Announcement.last

      if params[:commit] == '更新'
        if @announcement.update(announcement_params)
          redirect_to admin_index_path, notice: 'お知らせが更新されました。'
        else
          @announcement = Announcement.new(announcement_params)
          render :edit, status: :unprocessable_entity
        end
      elsif params[:commit] == 'キャンセル'
        @announcement = Announcement.new(announcement_params)
        render :edit, status: :see_other
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
