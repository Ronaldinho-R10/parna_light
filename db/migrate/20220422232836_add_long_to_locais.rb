class AddLongToLocais < ActiveRecord::Migration[7.0]
  def change
    add_column :locais, :long, :string
  end
end
