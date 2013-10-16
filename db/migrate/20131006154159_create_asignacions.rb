class CreateAsignacions < ActiveRecord::Migration
  def change
    create_table :asignacions do |t|
      t.integer :id_materia
      t.integer :id_estudiante
      t.integer :id_semestre

      t.timestamps
    end
  end
end
