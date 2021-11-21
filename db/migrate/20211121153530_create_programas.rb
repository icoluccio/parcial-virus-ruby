class CreateProgramas < ActiveRecord::Migration[6.1]
  def change
    create_table :programas do |t|
      t.string :nombre
      t.integer :ejecuciones
      t.belongs_to :computadora, null: false, foreign_key: true

      t.timestamps
    end
  end
end
