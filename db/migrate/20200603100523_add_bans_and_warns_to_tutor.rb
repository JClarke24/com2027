class AddBansAndWarnsToTutor < ActiveRecord::Migration[5.2]
  def change
    #to check if the tutor is banned - if so, forbid them from signing in
    add_column :tutors, :banned, :boolean
    #to check if the tutor has been warned - if so, display a message on their dashboard
    #if a user is warned 2 times then they will be banned
    add_column :tutors, :warned, :boolean
  end
end
