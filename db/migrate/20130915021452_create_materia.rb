class CreateMateria < ActiveRecord::Migration
  def change
    create_table :materia do |t|
      t.string :idu
      t.string :nombre

      t.timestamps
    end
  end
end
