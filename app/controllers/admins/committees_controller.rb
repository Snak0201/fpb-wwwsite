module Admins
  class CommitteesController < ApplicationController
    def index
      @committees = Committee.by_bureau
    end

    def edit
      @committee = Committee.find_by!(slug: params[:slug])
    end

    def update
      @committee = Committee.find_by!(slug: params[:slug])

      if params[:commit] == 'キャンセル'
        @committee = Committee.new(committee_params)
        render :edit, status: :see_other
      elsif params[:commit] == '更新'
        if @committee.update(committee_params)
          redirect_to admin_committees_path, notice: '委員会を更新しました。'
        else
          render :edit, status: :unprocessable_entity
        end
      end
    end

    def preview
      @committee = Committee.new(committee_params)
      # NOTE: slugの変更があった時、元のslugに対してリクエストしないと404になるため
      @update_target_committee = Committee.find_by!(slug: params[:slug])
      render :preview, status: :see_other
    end

    private

    def committee_params
      params.require(:committee).permit(:name, :slug, :description, :content, :bureau_id)
    end
  end
end