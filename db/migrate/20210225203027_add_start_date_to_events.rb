class AddStartDateToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :start_date, :datetime
  end
end
