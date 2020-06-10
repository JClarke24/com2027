class AddColumnsToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :name, :string
    add_column :students, :access_token, :string
    add_column :students, :expires_at, :datetime
    add_column :students, :refresh_token, :string
  end
end
