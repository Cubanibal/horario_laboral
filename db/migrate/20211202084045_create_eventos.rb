class CreateEventos < ActiveRecord::Migration[6.1]
  def change
    create_table :eventos do |t|
      t.string :name, presence: true
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
