class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements do |t|
      t.references :device, index: true, foreign_key: true
      t.text :data

      t.timestamps null: false
    end
  end
end
