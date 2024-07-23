class MarketplaceController < ApplicationController
  def show
    @coffee = Coffee.find(params[:id])
  end
end
