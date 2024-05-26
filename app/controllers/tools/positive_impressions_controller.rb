class Tools::PositiveImpressionsController < ApplicationController
  def show
    @positive_impression = Tools::PositiveImpression.new
    @value = ''
  end

  def create
    @positive_impression = Tools::PositiveImpression.new(positive_impression_params)

    if @positive_impression.valid?
      @value = @positive_impression.transition_list
      render :show, status: :see_other
    else
      @value = '失敗'
      render :show, status: :see_other
    end
  end

  def positive_impression_params
    params.require(:tools_positive_impression).permit(:positive_impression_value)
  end
end
