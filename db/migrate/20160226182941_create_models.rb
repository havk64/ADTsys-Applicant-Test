class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.references :make, foreign_key: true
      t.string :name, null: false

      t.timestamps null: false
    end
    add_index :models, :name
  end
end
