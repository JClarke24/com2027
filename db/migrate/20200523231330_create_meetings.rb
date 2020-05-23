class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.string :title, null: false
      t.text :description
      t.integer :tutor_id
      t.integer :student_id
      t.string :location
      t.datetime :startDateTime, null: false
      t.datetime :endDateTime, null: false
      t.boolean :student_accepted

      t.timestamps
    end
  end
end
