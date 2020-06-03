class AddRatedToStudent < ActiveRecord::Migration[5.2]
  def change
    # adds a field to determine if student has rated their tutor before
    #so that their rating doesn't count twice if they update it
    add_column :students, :rated, :boolean
  end
end
