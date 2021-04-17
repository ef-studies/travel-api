class CreateTravels < ActiveRecord::Migration[6.1]
  def change
    create_table :travels do |t|
      t.string :destination
      t.string :origin
      t.datetime :departure
      t.datetime :return

      t.timestamps
    end
  end
end
