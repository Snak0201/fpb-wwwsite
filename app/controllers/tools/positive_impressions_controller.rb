class Tools::PositiveImpressionsController < ApplicationController
  def show
    model = Tools::PositiveImpression.new(positive_impression_value: 2)
    @value = model.show_value
  end
end
