module Admins
  class CommitteesController < ApplicationController
    def index
      @committees = Committee.by_bureau
    end

    def edit
      @committee = Committee.find_by!(slug: params[:slug])
    end

    def preview
      @committee = Committee.new(committee_params)
      # NOTE: slugの変更があった時、元のslugに対してリクエストしないと404になるため
      @update_target_committee = Committee.find_by!(slug: params[:slug])
      render :preview, status: :see_other
    end

    private

    def committee_params
      params.require(:committee).permit(:name, :slug, :description, :content)
    end
  end
end
