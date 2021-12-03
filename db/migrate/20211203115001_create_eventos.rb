class CreateEventos < ActiveRecord::Migration[6.1]
  def change
    create_table :eventos do |t|
      t.string :name
      t.datetime :start_time
      t.datetime :end_time
      t.integer :user_id

      t.timestamps
    end
    add_index :eventos, :user_id
  end
end
