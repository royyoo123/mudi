class AddBusinessOwner < ActiveRecord::Migration[6.0]
  def change
  	add_column :users, :business_owner, :boolean
  end
end
