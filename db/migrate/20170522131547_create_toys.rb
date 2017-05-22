class CreateToys < ActiveRecord::Migration[5.0]
  def change
    create_table :toys do |t|
      t.string :name
      t.string :category
      t.integer :price
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
