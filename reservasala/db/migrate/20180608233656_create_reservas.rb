class CreateReservas < ActiveRecord::Migration[5.2]
  def change
    create_table :salas do |t|
      t.date "data"
      t.string "materia"
      t.string "turma"
      t.references "usuario"
      t.references "sala"
      t.references "horario"
    end
  end
end
