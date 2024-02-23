module Admins
  class BureausController < ApplicationController
    def index
      @bureaus = Bureau.all
    end

    def edit
      @bureau = Bureau.find_by!(slug: params[:slug])
    end

    def update
      @bureau = Bureau.new(bureau_params)
      p @bureau.valid?
    end

    private
    def bureau_params
      params.require(:bureau).permit(:name, :slug, :description, :content)
    end
  end
end
