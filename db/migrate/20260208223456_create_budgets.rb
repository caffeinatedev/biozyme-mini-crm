class CreateBudgets < ActiveRecord::Migration[7.2]
  def change
    create_table :budgets do |t|
      t.references :user, null: false, foreign_key: true
      t.references :contact, null: false, foreign_key: true

      t.integer :year, null: false
      t.integer :amount_cents, null: false

      t.timestamps
    end

    add_index :budgets, [:user_id, :contact_id, :year], unique: true
  end
end