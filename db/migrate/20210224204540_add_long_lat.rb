class AddLongLat < ActiveRecord::Migration[6.0]
  def change
  	add_column :events, :lat, :float
  	add_column :events, :lng, :float
  end
end
