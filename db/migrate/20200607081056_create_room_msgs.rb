class CreateRoomMsgs < ActiveRecord::Migration[5.2]
  def change
    create_table :room_msgs do |t|
      t.references :room, foreign_key: true
      t.references :student, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
