class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|

      t.string :source
      t.string :destination
      t.integer :price


      t.timestamps
    end
  end
end
