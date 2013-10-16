class CreateSemestres < ActiveRecord::Migration
  def change
    create_table :semestres do |t|
      t.string :id_sem

      t.timestamps
    end
  end
end
