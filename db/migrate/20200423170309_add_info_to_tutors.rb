class AddInfoToTutors < ActiveRecord::Migration[5.2]
  def change
    #the language which is to be taught
    add_column :tutors, :language, :string, default: "Language"
    # fuzzed location to be shown on the map
    # as a string of format "(lat, lng)"
    # validation to be added in the model
    add_column :tutors, :location, :string, default: "(0.0, 0.0)"

    # profile picture
    add_column :tutors, :image, :string

    # name and DOB for tutor - same reason
    add_column :tutors, :forename, :string, null: false, default: 'First Name'
    add_column :tutors, :surname, :string, null: false, default: 'Surname'
    add_column :tutors, :dob, :date

    # phone number for students to contact their tutor if needed
    add_column :tutors, :phone, :string, default: "Phone Number"

    add_column :tutors, :job, :string, default: "Job"
    add_column :tutors, :address, :string, default: "City"
    add_column :tutors, :country, :string, default: "Country"

    #tutor info - using datatype 'text' for longer strings
    add_column :tutors, :description, :text, default: "About me"
    add_column :tutors, :description2, :string, default: "What I offer?"

    #false if the tutor hasn't passed the quiz to become a tutor
    add_column :tutors, :approval, :integer, null: false, default: 0
  end
end
