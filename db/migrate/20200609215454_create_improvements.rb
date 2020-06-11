class CreateImprovements < ActiveRecord::Migration[5.2]
  def change
    create_table :improvements do |t|
      t.belongs_to :student
      t.belongs_to :tutor
      t.string :request
      t.integer :listening
      t.integer :writing
      t.integer :reading

      t.timestamps
    end
  end
end
