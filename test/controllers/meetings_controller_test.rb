require 'test_helper'

class MeetingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @meeting = meetings(:one)
  end

  test "should get index" do
    get meetings_url
    assert_response :success
  end

  test "should get new" do
    get new_meeting_url
    assert_response :success
  end

  test "should create meeting" do
    assert_difference('Meeting.count') do
      post meetings_url, params: { meeting: { description: @meeting.description, endDateTime: @meeting.endDateTime, location: @meeting.location, startDateTime: @meeting.startDateTime, student_accepted: @meeting.student_accepted, student_id: @meeting.student_id, title: @meeting.title, tutor_id: @meeting.tutor_id } }
    end

    assert_redirected_to meeting_url(Meeting.last)
  end

  test "should show meeting" do
    get meeting_url(@meeting)
    assert_response :success
  end

  test "should get edit" do
    get edit_meeting_url(@meeting)
    assert_response :success
  end

  test "should update meeting" do
    patch meeting_url(@meeting), params: { meeting: { description: @meeting.description, endDateTime: @meeting.endDateTime, location: @meeting.location, startDateTime: @meeting.startDateTime, student_accepted: @meeting.student_accepted, student_id: @meeting.student_id, title: @meeting.title, tutor_id: @meeting.tutor_id } }
    assert_redirected_to meeting_url(@meeting)
  end

  test "should destroy meeting" do
    assert_difference('Meeting.count', -1) do
      delete meeting_url(@meeting)
    end

    assert_redirected_to meetings_url
  end
end
