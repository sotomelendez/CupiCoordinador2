class CreateEstudiantes < ActiveRecord::Migration
  def change
    create_table :estudiantes do |t|
      t.string :stud_id
      t.string :name

      t.timestamps
    end
  end
end
