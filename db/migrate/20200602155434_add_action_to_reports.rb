class AddActionToReports < ActiveRecord::Migration[5.2]
  def change
    #to determine whether action has been taken on this report
    add_column :reports, :action, :boolean
  end
end
