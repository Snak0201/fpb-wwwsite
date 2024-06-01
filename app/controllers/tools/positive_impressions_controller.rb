class Tools::PositiveImpressionsController < ApplicationController
  def show
    @positive_impression = Tools::PositiveImpression.new
    @transitions = []
    @status_gains = []
  end

  def create
    @positive_impression = Tools::PositiveImpression.new(positive_impression_params)

    if @positive_impression.valid?
      @transitions = @positive_impression.transitions
      @status_gains = @positive_impression.status_gains
      render :show, status: :see_other
    else
      render :show, status: :unprocessable_entity
    end
  end

  def positive_impression_params
    params.require(:tools_positive_impression).permit(:positive_impression_value)
  end
end
