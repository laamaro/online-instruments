class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.references :question, null: false, foreign_key: true
      t.string :description
      t.integer :position
      t.integer :score

      t.timestamps
    end
  end
end
