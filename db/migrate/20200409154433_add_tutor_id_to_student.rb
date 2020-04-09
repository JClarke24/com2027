class AddTutorIdToStudent < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :tutor_id, :integer
  end
end
