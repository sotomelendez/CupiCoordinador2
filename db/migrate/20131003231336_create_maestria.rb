class CreateMaestria < ActiveRecord::Migration
  def change
    create_table :maestria do |t|
      t.string :codigo
      t.text :nombre

      t.timestamps
    end
  end
end
