class CreateAppliedInstruments < ActiveRecord::Migration[7.0]
  def change
    create_table :applied_instruments do |t|
      t.references :instrument, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
