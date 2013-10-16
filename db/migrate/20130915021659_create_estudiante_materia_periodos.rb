class CreateEstudianteMateriaPeriodos < ActiveRecord::Migration
  def change
    create_table :estudiante_materia_periodos do |t|
      t.integer :id_estudiante
      t.integer :id_materia
      t.integer :id_semestre

      t.timestamps
    end
  end
end
