module Admins
  class FibonacciNumbersController < ApplicationController
    def show
      client = Api::Fibonacci::Client.new
      @number = client.get_fibonacci_number
    rescue Api::Fibonacci::Client::FibonacciApiError => e
      @number = JSON.parse(e.message)
    end

    def create; end
  end
end
