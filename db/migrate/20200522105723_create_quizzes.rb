class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.string :tutor
      t.string :language
      t.string :topic
      t.string :level
      t.string :attachment
      t.belongs_to :tutor, foreign_key: true

      t.timestamps
    end
  end
end
