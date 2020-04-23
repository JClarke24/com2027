class AddConfirmedFieldToStudent < ActiveRecord::Migration[5.2]
  def change
    #this column determines whether the tutor has approved the request or not
    add_column :students, :tutor_confirmed, :boolean
    #false if the tutor has not yet accepted the request, true if they have
    #if the tutor declines the request, the tutor_id field is emptied
    change_column_default( :students, :tutor_confirmed, from:nil, to:false )
  end
end
