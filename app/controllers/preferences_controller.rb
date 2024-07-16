class PreferencesController < ApplicationController
  before_action :authenticate_user!

  def create
    @preference = Preference.new(preference_params)
    @preference.user_id = current_user.id

    if @preference.save
     
      @coffees = Coffee.where(coffee_form: @preference.coffee_form, coffee_type: @preference.coffee_type)
                       .where("weekly_consumption <= ?", @preference.weekly_consumption.to_i)

      render 'coffees/index'
    else
      render :new
    end
  end

  private

  def preference_params
    params.require(:preference).permit(:coffee_form, :weekly_consumption, :coffee_type)
  end
end