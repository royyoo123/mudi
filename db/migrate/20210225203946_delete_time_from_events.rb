class DeleteTimeFromEvents < ActiveRecord::Migration[6.0]
  def change
  	remove_column :events, :time, :time
  	remove_column :events, :date, :date
  end
end
