require 'test_helper'

class GankSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gank_session = gank_sessions(:one)
  end

  test "should get index" do
    get gank_sessions_url
    assert_response :success
  end

  test "should get new" do
    get new_gank_session_url
    assert_response :success
  end

  test "should create gank_session" do
    assert_difference('GankSession.count') do
      post gank_sessions_url, params: { gank_session: { character_name: 'test' } }
    end

    assert_redirected_to gank_session_url(GankSession.last)
  end

  test "should show gank_session" do
    get gank_session_url(@gank_session)
    assert_response :success
  end

  test "should get edit" do
    get edit_gank_session_url(@gank_session)
    assert_response :success
  end

  test "should update gank_session" do
    patch gank_session_url(@gank_session), params: { gank_session: { character_name: 'test2' } }
    assert_redirected_to gank_session_url(@gank_session)
  end

  test "should destroy gank_session" do
    assert_difference('GankSession.count', -1) do
      delete gank_session_url(@gank_session)
    end

    assert_redirected_to gank_sessions_url
  end
end
