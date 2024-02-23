module Admins
  class BureausController < ApplicationController
    def index
      @bureaus = Bureau.all
    end

    def edit
      @bureau = Bureau.find_by!(slug: params[:slug])
    end

    def update; end
  end
end
