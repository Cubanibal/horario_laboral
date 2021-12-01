class CreateEventos < ActiveRecord::Migration[6.1]
  def change
    create_table :eventos do |t|
      t.string :nombre
      t.datetime :fecha_inicial
      t.datetime :fecha_final

      t.timestamps
    end
  end
end
