class AddFieldsToPreferences < ActiveRecord::Migration[7.1]
  def change
    add_column :preferences, :coffee_form, :string, array: true, default: []
    add_column :preferences, :weekly_consumption, :integer, array: true, default: []
    add_column :preferences, :coffee_type, :string, array: true, default: []
  end
end
