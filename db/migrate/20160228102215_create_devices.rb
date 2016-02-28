class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name, null: false
      t.text :info

      t.references :location, null: false

      t.timestamps null: false
    end
  end
end
