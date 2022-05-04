class CreateLocais < ActiveRecord::Migration[7.0]
  def change
    create_table :locais do |t|
      t.string :bairro
      t.string :referencia
      t.string :logradouro
      t.integer :numero
      t.string :rua
      t.timestamps
    end
  end
end
