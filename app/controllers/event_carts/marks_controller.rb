module EventCarts
  class MarksController < ApplicationController
    before_action :set_noindex_nofollow
    def new
      @mark = EventCarts::Cart.enabled.find_by!(params[:unique_code]).marks.new
      @cart = EventCarts::Cart.enabled.find_by!(params[:unique_code])
    end

    def edit
      @mark = EventCarts::Cart.enabled.find_by!(params[:unique_code]).marks.find(params[:id]).decorate
    end

    def create
      @mark = EventCarts::Cart.enabled.find_by!(params[:unique_code]).marks.new(mark_params)

      if @mark.save
        redirect_to event_carts_cart_path(@mark.cart), notice: '買いたいものを登録しました。'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def update
      @mark = EventCarts::Cart.enabled.find_by!(params[:unique_code]).marks.find(params[:id])

      if @mark.update(mark_params)
        redirect_to event_carts_cart_path(@mark.cart), notice: '買いたいものを保存しました。'
      else
        @mark.assign_attributes(mark_params)
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy; end

    def update_status
      @mark = EventCarts::Cart.enabled.find_by!(params[:unique_code]).marks.find(params[:id]).decorate

      if @mark.update(status: params[:status])
        redirect_to event_carts_cart_mark_path(@mark.cart, @mark), notice: 'ステータスを変更しました。'
      else
        render :edit, status: :unprocessable_entity
      end
    end

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
