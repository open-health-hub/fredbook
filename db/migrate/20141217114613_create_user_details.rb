class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.string :first_name
      t.string :last_name
      t.string :needs
      t.text :carers
      t.text :cares_for
      t.integer :user_id

      t.timestamps
    end
  end
end
