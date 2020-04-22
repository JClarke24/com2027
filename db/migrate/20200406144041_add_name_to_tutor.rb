class AddNameToTutor < ActiveRecord::Migration[5.2]
  def change
    #name and DOB - name for personalisation + telling the tutor who is who
    #DOB for age validation
    add_column :students, :forename, :string, null: false, default: 'First Name'
    add_column :students, :surname, :string, null: false, default: 'Surname'
    add_column :students, :dob, :date

    #name and DOB for tutor - same reason
    add_column :tutors, :forename, :string, null: false, default: 'First Name'
    add_column :tutors, :surname, :string, null: false, default: 'Surname'
    add_column :tutors, :dob, :date

    #tutor info - using datatype 'text' for longer strings
    add_column :tutors, :description, :text

  end
end
