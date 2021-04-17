class ChangeAtributesTravel < ActiveRecord::Migration[6.1]
  def change
    rename_column(:travels, :return, :return_date)
    rename_column(:travels, :departure, :departure_date)
  end
end
