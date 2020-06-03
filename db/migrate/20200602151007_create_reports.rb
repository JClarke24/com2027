class CreateReports < ActiveRecord::Migration[5.2]
  def change
    create_table :reports do |t|
      t.integer :user_id
      t.string :user_type
      t.string :reason
      t.text :description
      t.boolean :action

      t.timestamps
    end
  end
end
