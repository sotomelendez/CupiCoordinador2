class CreateCupos < ActiveRecord::Migration
  def change
    create_table :cupos do |t|
      t.integer :id_materia
      t.integer :num_cupos

      t.timestamps
    end
  end
end
