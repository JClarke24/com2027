class AddCurrentRatingToStudent < ActiveRecord::Migration[5.2]
  def change
    #this will help students see what they've rated their tutor
    #in case they wish to update this rating
    add_column :students, :current_rating, :integer
  end
end
