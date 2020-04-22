class FixSignUpForTutor < ActiveRecord::Migration[5.2]
  def change
    #whoops! having no default on the location column means that tutors can't
    #sign up, because the null string isn't compatible with regex.
    #so here we set a default location of (0,0). this isn't going to cause issues
    #because this is in the middle of the sea so can't be interpreted as a
    #correct lat,lng value. therefore we can screen for this w/o excluding valid data
    change_column_default( :tutors, :location, from:nil, to:"(0.0, 0.0)")
  end
end
