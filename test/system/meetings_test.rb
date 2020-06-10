require "application_system_test_case"

class MeetingsTest < ApplicationSystemTestCase
  setup do
    @meeting = meetings(:one)
  end

  test "visiting the index" do
    visit meetings_url
    assert_selector "h1", text: "Meetings"
  end

  test "creating a Meeting" do
    visit meetings_url
    click_on "New Meeting"

    fill_in "Description", with: @meeting.description
    fill_in "Enddatetime", with: @meeting.endDateTime
    fill_in "Location", with: @meeting.location
    fill_in "Startdatetime", with: @meeting.startDateTime
    check "Student accepted" if @meeting.student_accepted
    fill_in "Student", with: @meeting.student_id
    fill_in "Title", with: @meeting.title
    fill_in "Tutor", with: @meeting.tutor_id
    click_on "Create Meeting"

    assert_text "Meeting was successfully created"
    click_on "Back"
  end

  test "updating a Meeting" do
    visit meetings_url
    click_on "Edit", match: :first

    fill_in "Description", with: @meeting.description
    fill_in "Enddatetime", with: @meeting.endDateTime
    fill_in "Location", with: @meeting.location
    fill_in "Startdatetime", with: @meeting.startDateTime
    check "Student accepted" if @meeting.student_accepted
    fill_in "Student", with: @meeting.student_id
    fill_in "Title", with: @meeting.title
    fill_in "Tutor", with: @meeting.tutor_id
    click_on "Update Meeting"

    assert_text "Meeting was successfully updated"
    click_on "Back"
  end

  test "destroying a Meeting" do
    visit meetings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Meeting was successfully destroyed"
  end
end
