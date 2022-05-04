class AddRuaToLocal < ActiveRecord::Migration[7.0]
  def change
    add_column :locais, :rua, :string
  end
end
