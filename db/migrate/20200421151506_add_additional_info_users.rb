class AddAdditionalInfoUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :tutors, :job, :string, default: "Job"
    add_column :tutors, :address, :string, default: "City"
    add_column :tutors, :country, :string, default: "Country"
    add_column :tutors, :description2, :string, default: "What I offer?"
    add_column :tutors, :language, :string, default: "Language"

    add_column :students, :job, :string, default: "Job"
    add_column :students, :address, :string, default: "City"
    add_column :students, :country, :string, default: "Country"
    add_column :students, :language, :string, default: "Language"

  end
end
