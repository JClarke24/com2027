class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    #the language which is to be learned
    add_column :students, :language, :string
    #not adding the student's location at the moment
    #as it is unlikely the student will change tutors several times

  #the language which is to be taught
  add_column :tutors, :language, :string
  # fuzzed location to be shown on the map
  # as a string of format "(lat, lng)"
  # validation to be added in the model
  add_column :tutors, :location, :string
  end
end
