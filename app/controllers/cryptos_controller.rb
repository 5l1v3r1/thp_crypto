class CryptosController < ApplicationController
  def index
    @cryptos = CryptoPrices.new.perform
    @crypto_name = params[:crypto_name]
  end
end
