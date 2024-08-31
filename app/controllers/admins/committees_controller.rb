module Admins
  class CommitteesController < ApplicationController
    def index
      @committees = Committee.by_bureau.by_special
    end

    def new
      @committee = Committee.new
    end

    def edit
      @committee = Committee.find_by!(slug: params[:slug])
    end

    def create
      @committee = Committee.new(committee_params)

      if @committee.save
        redirect_to admin_committees_path, notice: '委員会が登録されました'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      @committee = Committee.find_by!(slug: params[:slug])

      if params[:commit] == 'キャンセル'
        @committee = Committee.new(committee_params)
        render :edit, status: :see_other
      elsif params[:commit] == '更新'
        if @committee.update(committee_params)
          redirect_to admin_committees_path, notice: '委員会を更新しました'
        else
          render :edit, status: :unprocessable_entity
        end
      end
    end

    def destroy
      @committee = Committee.find_by!(slug: params[:slug])

      if @committee.destroy
        redirect_to admin_committees_path, notice: '委員会が削除されました'
      else
        render :show, status: :unprocessable_entity
      end
    end

    def create_preview
      @committee = Committee.new(committee_params)
      render :create_preview, status: :see_other
    end

    def update_preview
      @committee = Committee.new(committee_params)
      # NOTE: slugの変更があった時、元のslugに対してリクエストしないと404になるため
      @update_target_committee = Committee.find_by!(slug: params[:slug])
      render :update_preview, status: :see_other
    end

    private

    def committee_params
      params.require(:committee).permit(:name, :slug, :description, :content, :bureau_id, :special)
    end
  end
end
