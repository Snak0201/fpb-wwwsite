module EventCart
  class CartsController < ApplicationController
    def index
      @cart = EventCart::Cart.new
    end

    def show; end

    def edit; end

    def create; end

    def update; end

    def destroy; end
  end
end
