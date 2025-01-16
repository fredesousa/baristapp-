class ChangeStrengthToIntegerInCoffees < ActiveRecord::Migration[6.0]
  def change
    change_column :coffees, :strength, 'integer USING strength::integer'
  end
end
