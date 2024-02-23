module Admins
  class BureausController < ApplicationController
    def index
      @bureaus = Bureau.all
    end

    def edit
      @bureau = Bureau.find_by!(slug: params[:slug])
    end

    def update
      @bureau = Bureau.find_by!(slug: params[:slug])

      if params[:commit] == 'キャンセル'
        render :edit, status: :see_other
      elsif params[:commit] == '更新'
        if @bureau.update(bureau_params)
          redirect_to admin_bureaus_path, notice: '局を更新しました。'
        else
          render :edit, status: :unprocessable_entity
        end
      end
    end

    def preview
      @bureau = Bureau.new(bureau_params)
      # NOTE: slugの変更があった時、元のslugに対してリクエストしないと404になるため
      @update_target_bureau = Bureau.find_by!(slug: params[:slug])
      render :preview, status: :see_other
    end

    private

    def bureau_params
      params.require(:bureau).permit(:name, :slug, :description, :content)
    end
  end
end
