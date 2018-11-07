class HomeController < ApplicationController
  def index
    @cryptos = StartScrap.new.perform
    @crypto_name = params[:crypto_name]
  end
end
