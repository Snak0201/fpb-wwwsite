module Admins
  class BureausController < ApplicationController
    def index
      @bureaus = Bureau.all
    end

    def show
      @bureau = Bureau.find_by!(slug: params[:slug])
    end

    def edit; end

    def update; end
  end
end
