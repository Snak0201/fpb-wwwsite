module Admins
  class FibonacciNumbersController < ApplicationController
    def show
      api_response = Api::Fibonacci::Client.new.get_fibonacci_number(params[:n])
      @default = params[:n]
      @number = api_response[:body][:value]
    rescue Api::Fibonacci::Client::FibonacciApiError => e
      @number = api_error_message e
    end

    private
    def api_error_message(err)
      JSON.parse(err.message.split("body: ")[-1], symbolize_names: true)[:errors]
    end
  end
end
