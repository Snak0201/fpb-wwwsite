module Admins
  class CommitteesController < ApplicationController
    def index
      @committees = Committee.by_bureau
    end

    def edit
      @committee = Committee.find_by!(slug: params[:slug])
    end

    def preview

    end
  end
end
