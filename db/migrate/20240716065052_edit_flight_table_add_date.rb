class EditFlightTableAddDate < ActiveRecord::Migration[6.1]
  def change
    add_column :flights , :depart_date, :date
  end
end
