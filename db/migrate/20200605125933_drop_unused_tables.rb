class DropUnusedTables < ActiveRecord::Migration[5.2]
  def change
    #delete the tables left behind by unused gems
    drop_table(:rating_rates, if_exists: true)
    drop_table(:rating_ratings, if_exists: true)
  end
end
