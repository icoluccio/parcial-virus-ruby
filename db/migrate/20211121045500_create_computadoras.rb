class CreateComputadoras < ActiveRecord::Migration[6.1]
  def change
    create_table :computadoras do |t|
      t.float :memoria
      t.float :disco
      t.timestamps
    end
  end
end
