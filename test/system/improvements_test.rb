require "application_system_test_case"

class ImprovementsTest < ApplicationSystemTestCase
  setup do
    @improvement = improvements(:one)
  end

  test "visiting the index" do
    visit improvements_url
    assert_selector "h1", text: "Improvements"
  end

  test "creating a Improvement" do
    visit improvements_url
    click_on "New Improvement"

    fill_in "Listening", with: @improvement.listening
    fill_in "Reading", with: @improvement.reading
    fill_in "Student", with: @improvement.student
    fill_in "Tutor", with: @improvement.tutor
    fill_in "Writing", with: @improvement.writing
    click_on "Create Improvement"

    assert_text "Improvement was successfully created"
    click_on "Back"
  end

  test "updating a Improvement" do
    visit improvements_url
    click_on "Edit", match: :first

    fill_in "Listening", with: @improvement.listening
    fill_in "Reading", with: @improvement.reading
    fill_in "Student", with: @improvement.student
    fill_in "Tutor", with: @improvement.tutor
    fill_in "Writing", with: @improvement.writing
    click_on "Update Improvement"

    assert_text "Improvement was successfully updated"
    click_on "Back"
  end

  test "destroying a Improvement" do
    visit improvements_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Improvement was successfully destroyed"
  end
end
