class AddAttributesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :registration_number, :string
    add_column :users, :role, :integer
    add_column :users, :birth_date, :date
  end
end
