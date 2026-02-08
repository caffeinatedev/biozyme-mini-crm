class CreateContacts < ActiveRecord::Migration[7.2]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email
      t.string :company
      t.references :primary_user, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :contacts, :email
  end
end