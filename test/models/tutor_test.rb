require 'test_helper'

class TutorTest < ActiveSupport::TestCase
  setup do
    @tutor = tutors(:tutor1)
  end

  # Tests empty tutor shouldn't be saved
  test 'should not saved invalid tutor' do
    tutor = Tutor.new
    tutor.save
    refute tutor.valid?
  end

  # Tests tutor should be saved
  test 'should save valid tutor' do
    tutor = @tutor
    tutor.save
    assert tutor.valid?
  end


  test 'should not save dublicates' do
    tutor = Tutor.new
    tutor = @tutor
    tutor.save
    assert tutor.valid?

    tutor2 = Tutor.new
    tutor2 = @tutor
    tutor2.save
    refute tutor2.valid?

  end
end
