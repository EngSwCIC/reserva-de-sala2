class CreateHorarios < ActiveRecord::Migration[5.2]
  def change
    create_table :horarios do |t|
      t.string "horario"
    end
  end
end
