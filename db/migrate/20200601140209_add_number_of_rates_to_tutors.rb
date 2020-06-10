class AddNumberOfRatesToTutors < ActiveRecord::Migration[5.2]
  def change
    add_column :tutors, :num_rates, :integer
  end
end
