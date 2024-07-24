class AddPriceAndRoasterToCoffees < ActiveRecord::Migration[7.1]
  def change
    add_column :coffees, :price, :decimal
    add_column :coffees, :roaster, :string
  end
end
