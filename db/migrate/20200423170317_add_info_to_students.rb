class AddInfoToStudents < ActiveRecord::Migration[5.2]
  def change
    #the language which is to be learned
    add_column :students, :language, :string, default: "Language"

    # profile picture
    add_column :students, :image, :string
    #not adding the student's location at the moment
    #as it is unlikely the student will change tutors several times
    #name and DOB - name for personalisation + telling the tutor who is who
    #DOB for age validation
    add_column :students, :forename, :string, default: 'First Name'
    add_column :students, :surname, :string, default: 'Surname'
    add_column :students, :dob, :date

    # phone number for tutors to contact their students if needed
    add_column :students, :phone, :string, default: "Phone Number"
    add_column :students, :job, :string, default: "Job"
    add_column :students, :address, :string, default: "City"
    add_column :students, :country, :string, default: "Country"

    #the id of the tutor which is teaching the student
    add_column :students, :tutor_id, :integer
    #this column determines whether the tutor has approved the request or not
    #false if the tutor has not yet accepted the request, true if they have
    #if the tutor declines the request, the tutor_id field is emptied
    add_column :students, :tutor_confirmed, :boolean, default: false
  end
end
