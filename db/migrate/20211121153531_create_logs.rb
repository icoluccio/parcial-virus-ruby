class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs do |t|
      t.belongs_to :programa, null: false, foreign_key: true
      t.belongs_to :computadora, null: false, foreign_key: true
      t.text :hecho
      t.integer :turno

      t.timestamps
    end
  end
end
