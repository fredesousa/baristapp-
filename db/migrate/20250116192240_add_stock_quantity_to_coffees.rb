class AddStockQuantityToCoffees < ActiveRecord::Migration[7.1]
  def change
    add_column :coffees, :stock_quantity, :integer
  end
end
