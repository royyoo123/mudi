class AddTimeToEvent < ActiveRecord::Migration[6.0]
  def change
  	add_column :events, :time, :string
  end
end
