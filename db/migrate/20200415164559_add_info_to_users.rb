class AddInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :tutors, :forename, :string, default: "Forename"
    add_column :tutors, :surname, :string, default: "Surname"
    add_column :tutors, :dob, :date
    add_column :tutors, :phone, :string, default: "Phone Number"
    add_column :tutors, :description, :string, default: "Description"

    add_column :students, :forename, :string, default: "Forename"
    add_column :students, :surname, :string, default: "Surname"
    add_column :students, :dob, :date
    add_column :students, :phone, :string, default: "Phone Number"
  end
end
