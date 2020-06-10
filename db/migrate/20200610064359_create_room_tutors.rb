class CreateRoomTutors < ActiveRecord::Migration[5.2]
  def change
    create_table :room_tutors do |t|
      t.string :name

      t.timestamps
    end
    add_index :room_tutors, :name, unique: true
  end
end
