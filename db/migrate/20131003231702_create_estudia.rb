class CreateEstudia < ActiveRecord::Migration
  def change
    create_table :estudia do |t|
      t.integer :id_estudiante
      t.integer :id_maestria

      t.timestamps
    end
  end
end
