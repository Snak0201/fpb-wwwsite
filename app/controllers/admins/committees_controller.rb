module Admins
  class CommitteesController < ApplicationController
    def index
      @committees = Committee.by_bureau
    end
  end
end
