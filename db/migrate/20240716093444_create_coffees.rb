class CreateCoffees < ActiveRecord::Migration[7.1]
  def change
    create_table :coffees do |t|
      t.string :name
      t.string :origin
      t.string :roaster
      t.text :description
      t.string :strength
      t.string :coffee_type
      t.string :machin_type

      t.timestamps
    end
  end
end
