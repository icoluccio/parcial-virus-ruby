class CreateProgramas < ActiveRecord::Migration[6.1]
  def change
    create_table :programas do |t|
      t.string :nombre
      t.boolean :ejecutando, default: false
      t.integer :memoria, default: 0
      t.integer :disco, default: 0
      t.integer :ejecuciones, default: 0
      t.belongs_to :computadora, null: true, foreign_key: true
      t.belongs_to :programa, null: true, foreign_key: true

      t.timestamps
    end
  end
end
