module EventCarts
  class MarksController < ApplicationController
    before_action :set_noindex_nofollow
    def new
      @mark = EventCarts::Cart.find_by!(params[:unique_code]).marks.new
      @cart = EventCarts::Cart.find_by!(params[:unique_code])
    end

    def edit; end

    def create
      @mark = EventCarts::Cart.find_by!(params[:unique_code]).marks.new(mark_params)

      if @mark.save
        redirect_to event_carts_cart_path(@mark.cart), notice: '買いたいものを登録しました。'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update; end

    def destroy; end

    private

    def mark_params
      params.require(:event_carts_mark).permit(%i[name place_1st place_2nd place_3rd circle_name budget circle_sns memo
                                                  order_number])
    end

    def set_noindex_nofollow
      # NOTE: 検索画面に出てこないようにする
      response.set_header('X-Robots-Tag', 'noindex, nofollow')
    end
  end
end
