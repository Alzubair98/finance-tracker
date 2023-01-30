class StocksController < ApplicationController
    
    def search
        if params[:stock].present?
            @stock = Stock.new_lookup(params[:stock].capitalize)
            if @stock #checking if the stock is not nil (wrong)
                render 'users/my_portfolio'
            else
                flash[:alert] = 'Wrong Symbol. Please Enter Correct Symbol'
                redirect_to my_portfolio_path
            end
        else 
            flash[:alert] = 'Please enter a symbol to search'
            redirect_to my_portfolio_path
        end
    end
end