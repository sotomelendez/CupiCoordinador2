class CreateSemvas < ActiveRecord::Migration
  def change
    create_table :semvas do |t|     
      t.integer :id_estudiante
      t.integer :sem

      t.timestamps
    end
  end
end
