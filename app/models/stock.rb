class Stock < ApplicationRecord

    has_many :user_stocks
    has_many :users, through: :user_stocks


    validates :name, :ticker_symbol, presence: true
    def self.new_lookup(ticker_symbol)
        client = IEX::Api::Client.new(
            publishable_token: Rails.application.credentials.iex_client[:publish_key],
            secret_token: Rails.application.credentials.iex_client[:secret_key],
            endpoint: 'https://cloud.iexapis.com/v1'
          )

        begin
            new(ticker: ticker_symbol, name: client.company(ticker_symbol).company_name, last_price:client.quote(ticker_symbol).latest_price)
        rescue => exception
            return nil
        end
    end
end
