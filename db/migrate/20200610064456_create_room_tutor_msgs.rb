class CreateRoomTutorMsgs < ActiveRecord::Migration[5.2]
  def change
    create_table :room_tutor_msgs do |t|
      t.references :roomtutor, foreign_key: true
      t.references :tutor, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
