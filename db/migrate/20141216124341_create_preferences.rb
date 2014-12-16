class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.integer :care_data_privacty_setting

      t.timestamps
    end
  end
end
