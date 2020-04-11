class AddTutorIdToStudent < ActiveRecord::Migration[5.2]
  def change
    #the id of the tutor which is teaching the student
    add_column :students, :tutor_id, :integer
  end
end
