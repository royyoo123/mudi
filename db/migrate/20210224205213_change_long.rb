class ChangeLong < ActiveRecord::Migration[6.0]
  def change
  	rename_column :events, :lng, :longitude
  	rename_column :events, :lat, :latitude
  end
end
