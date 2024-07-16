class CreatePreferences < ActiveRecord::Migration[7.1]
  def change
    create_table :preferences do |t|
      t.references :user, null: false, foreign_key: true
      t.references :coffee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
