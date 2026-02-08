class CreateSales < ActiveRecord::Migration[7.2]
  def change
    create_table :sales do |t|
      t.references :user, null: false, foreign_key: true
      t.references :contact, null: false, foreign_key: true

      t.integer :amount_cents, null: false
      t.date :sold_on, null: false

      t.timestamps
    end

    add_index :sales, :sold_on
  end
end