class AddDefaultToStudents < ActiveRecord::Migration[5.2]
  def change
    #forgot the current_rating field in the last migration and it won't let me rollback
    change_column_default :students, :current_rating, from: nil, to: 0
    #also add default for 'action' to reports, for sorting by unactioned reports
    change_column_default :reports, :action, from: nil, to: 0
  end
end
