class CreateMedicalEvents < ActiveRecord::Migration
  def change
    create_table :medical_events do |t|
      t.string :summary
      t.text :description
      t.timestamp :occurred_at
      t.references :user, index: true

      t.timestamps
    end
  end
end
