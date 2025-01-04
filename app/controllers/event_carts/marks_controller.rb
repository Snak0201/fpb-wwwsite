module EventCarts
  class MarksController < ApplicationController
    def new
      @mark = EventCarts::Cart.find_by!(params[:unique_code]).marks.new
    end

    def edit; end

    def create; end

    def update; end

    def destroy; end
  end
end
