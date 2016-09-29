class CreateMakes < ActiveRecord::Migration
  def change
    create_table :makes do |t|
      t.string :name
      t.integer :webmotors_id

      t.timestamps null: false
    end
    add_index :makes, :name
  end
end
