class CoffeesController < ApplicationController
  before_action :set_coffee, only: [:show]

  def index
    @coffees = Coffee.all
  end

  def show
  end

  def new
    @coffee = Coffee.new
  end

  def create
    @coffee = Coffee.new(coffee_params)
    if @coffee.save
      redirect_to @coffee, notice: 'Coffee was successfully created.'
    else
      render :new
    end
  end

  private

  def set_coffee
    @coffee = Coffee.find(params[:id])
  end

  def coffee_params
    params.require(:coffee).permit(:name, :description, :origin, :roaster, :strength, :coffee_type, :machine_type)
  end
end
