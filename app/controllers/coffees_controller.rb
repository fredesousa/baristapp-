class CoffeesController < ApplicationController
  def index
    @coffees_by_origin = Coffee.all.group_by(&:origin)
    @coffees_by_strength = Coffee.all.group_by(&:strength)
    @coffees_by_coffee_type = Coffee.all.group_by(&:coffee_type)
    @filters_applied = false

    # Filtrage par recherche de nom
    if params[:search].present?
      @filters_applied = true
      @coffees_by_origin.each do |origin, coffees|
        @coffees_by_origin[origin] = coffees.select { |coffee| coffee.name.downcase.include?(params[:search].downcase) }
      end
    end

    # Filtrage par origine
    if params[:origin].present?
      @filters_applied = true
      @coffees_by_origin.select! { |origin, _| origin == params[:origin] }
    end

    # Filtrage par force du café
    if params[:search_strength].present?
      @filters_applied = true
      @coffees_by_origin.each do |origin, coffees|
        @coffees_by_origin[origin] = coffees.select { |coffee| coffee.strength == params[:search_strength].to_i }
      end
    end

    # Filtrage par type de café
    if params[:coffee_type].present?
      @filters_applied = true
      @coffees_by_origin.each do |origin, coffees|
        @coffees_by_origin[origin] = coffees.select { |coffee| coffee.coffee_type == params[:coffee_type] }
      end
    end

    # Filtrage par type de machine
    if params[:machin_type].present?
      @filters_applied = true
      @coffees_by_origin.each do |origin, coffees|
        @coffees_by_origin[origin] = coffees.select { |coffee| coffee.machin_type == params[:machin_type] }
      end
    end
  end

  def show
    @coffee = Coffee.find(params[:id])
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
