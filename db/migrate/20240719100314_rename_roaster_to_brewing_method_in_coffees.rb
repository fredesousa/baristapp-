class RenameRoasterToBrewingMethodInCoffees < ActiveRecord::Migration[7.1]
  def change
    rename_column :coffees, :roaster, :brewing_method
  end
end
