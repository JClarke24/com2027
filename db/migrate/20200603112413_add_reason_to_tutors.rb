class AddReasonToTutors < ActiveRecord::Migration[5.2]
  def change
    #to make warn/ban messages clearer
    add_column :tutors, :flag_reason, :string
  end
end
