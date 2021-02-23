class CreateEventMoods < ActiveRecord::Migration[6.0]
  def change
    create_table :event_moods do |t|
      t.references :event, null: false, foreign_key: true
      t.references :mood, null: false, foreign_key: true

      t.timestamps
    end
  end
end
