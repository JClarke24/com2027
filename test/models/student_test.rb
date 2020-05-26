require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  setup do
    @student = students(:student1)
  end

  # Tests empty student shouldn't be saved
  test 'should not saved invalid student' do
    student = Student.new
    student.save
    refute student.valid?
  end

  # Tests student should be saved
  test 'should save valid student' do
    student = @student
    student.save
    assert student.valid?
  end



end
