class DeleteLongitudeLatitude < ActiveRecord::Migration[6.0]
  def change
  	remove_column :events, :latitude
		remove_column :events, :longitude
  end
end
