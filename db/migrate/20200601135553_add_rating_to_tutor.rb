class AddRatingToTutor < ActiveRecord::Migration[5.2]
  def change
    drop_table(:rating, if_exists: true)
    drop_table(:rates, if_exists: true)
    add_column :tutors, :rating, :decimal
  end
end
