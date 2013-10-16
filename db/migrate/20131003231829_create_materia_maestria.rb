class CreateMateriaMaestria < ActiveRecord::Migration
  def change
    create_table :materia_maestria do |t|
      t.integer :id_materia
      t.integer :id_maestria

      t.timestamps
    end
  end
end
