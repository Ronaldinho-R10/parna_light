class AddLatToLocais < ActiveRecord::Migration[7.0]
  def change
    add_column :locais, :lat, :string
  end
end
