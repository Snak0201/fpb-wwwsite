module EventCart
  class CartsController < ApplicationController
    before_action :set_x_robots_tag, only: %i[show edit create update destroy]

    def index
      @cart = EventCart::Cart.new
    end

    def show
      @cart = EventCart::Cart.enabled.find_by!(unique_code: params[:unique_code])
    end

    def edit
      @cart = EventCart::Cart.enabled.find_by!(unique_code: params[:unique_code])
    end

    def create
      @cart = EventCart::Cart.new(create_cart_params)
      if @cart.valid?
        service = EventCart::CreateCart.run(create_cart_params)

        if service.result
          redirect_to event_cart_cart_path(service.result), notice: '登録しました。URLを保存しておいてください。'
        else
          redirect_to event_cart_root_path, alert: '登録に失敗しました。'
        end
      else
        render :index, status: :unprocessable_entity
      end
    end

    def update; end

    def destroy
      @cart = EventCart::Cart.enabled.find_by!(unique_code: params[:unique_code])

      if @cart.update(disabled: true, disabled_at: Time.current)
        redirect_to event_cart_root_path, notice: 'カートを削除しました。ご利用ありがとうございました。'
      else
        render :show, status: :unprocessable_entity
      end
    end

    private

    def create_cart_params
      params.require(:event_cart_cart).permit(:name, :held_at, :place, :atlas, :memo)
    end

    def set_x_robots_tag
      # NOTE: 検索画面に出てこないようにする
      response.set_header('X-Robots-Tag', 'noindex, nofollow')
    end
  end
end
