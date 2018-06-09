class CreateSalas < ActiveRecord::Migration[5.2]
  def change
    create_table :salas do |t|
      t.string "predio"
      t.string "numero"
    end
  end
end
