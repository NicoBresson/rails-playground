class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.boolean :validated
      t.date :start_time
      t.date :end_time
      t.references :toy, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :rating

      t.timestamps
    end
  end
end
