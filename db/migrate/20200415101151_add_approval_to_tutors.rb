class AddApprovalToTutors < ActiveRecord::Migration[5.2]
  def change
    add_column :tutors, :approval, :integer, null: false, default: 0
  end
end
