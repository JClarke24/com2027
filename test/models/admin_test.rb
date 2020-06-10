require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  setup do
    @admin = admins(:admin1)
  end

  # Tests empty student shouldn't be saved
  test 'should not saved invalid admin' do
    admin = Admin.new
    admin.save
    refute admin.valid?
  end

  # Tests student should be saved
  test 'should save valid admin' do
    admin = @admin
    admin.save
    assert admin.valid?
  end
end
