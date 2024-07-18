class AddUseridInFlights < ActiveRecord::Migration[6.1]
  def change

    add_column :flights, :user_id, :int
  end
end
