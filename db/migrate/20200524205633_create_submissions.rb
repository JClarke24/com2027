class CreateSubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :submissions do |t|
      t.belongs_to :student, foreign_key: true
      t.belongs_to :tutor, foreign_key: true
      t.string :description
      t.string :attachment2

      t.timestamps
    end
  end
end
