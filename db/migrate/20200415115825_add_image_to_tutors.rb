class AddImageToTutors < ActiveRecord::Migration[5.2]
  def change
    add_column :tutors, :image, :string
  end
end
