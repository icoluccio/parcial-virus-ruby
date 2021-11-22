class CreateProgramas < ActiveRecord::Migration[6.1]
  def change
    create_table :programas do |t|
      t.string :nombre
      t.string :type, default: 'Programa'
      t.boolean :ejecutando, default: false
      t.integer :potencia, default: 0
      t.integer :memoria, default: 0
      t.integer :disco, default: 0
      t.integer :ejecuciones, default: 0
      t.belongs_to :computadora, null: true, foreign_key: true
      t.belongs_to :programa, null: true, foreign_key: true

      t.timestamps
    end
  end
end
