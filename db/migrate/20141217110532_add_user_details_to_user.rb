class AddUserDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :needs, :string
    add_column :users, :carers, :text
    add_column :users, :cares_for, :text
  end
end
