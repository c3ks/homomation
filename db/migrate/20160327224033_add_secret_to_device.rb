class AddSecretToDevice < ActiveRecord::Migration
  def change
    change_table :devices do |t|
      t.string :secret
    end
  end
end
