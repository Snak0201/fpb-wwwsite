module Admins
  class FibonacciNumbersController < ApplicationController
    def show
      api_response = Api::Fibonacci::Client.new.get_fibonacci_number(params[:n])
      @default = params[:n]
      @number = api_response[:body][:value]
    rescue Api::Fibonacci::Client::FibonacciApiError => e
      @number = eval(e.message)[:body][:errors] # rubocop:todo Security/Eval
    end
  end
end
