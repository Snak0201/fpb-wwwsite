class FortunesController < ApplicationController
  def index
  end

  def fortune
    @fortune = 1
    render partial: 'fortune'
  end
end
