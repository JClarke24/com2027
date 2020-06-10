class AddDefaultValuesToUsers < ActiveRecord::Migration[5.2]
  def change
    #adding default values of 0 to rated, num_rates and rating.
    #this is to ensure star rating can handle errors
    change_column_default :students, :rated, 0
    change_column_default :tutors, :rating, 0
    change_column_default :tutors, :num_rates, 0
  end
end
