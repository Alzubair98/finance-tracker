class StocksController < ApplicationController
    
    def search
        @stock = Stock.new_lookup(params[:stock].capitalize)
        render 'users/my_portfolio'
    end
  end