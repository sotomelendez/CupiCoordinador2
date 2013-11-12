class CreateMateriasVistas < ActiveRecord::Migration
  def change
    create_table :materias_vistas do |t|
      t.integer :id_estudiante
      t.string :cod_materia

      t.timestamps
    end
  end
end
