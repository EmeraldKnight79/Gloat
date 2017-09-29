require 'test_helper'

class GankSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gank_session = gank_sessions(:one)
    @character = characters(:one)
  end

  test "does get index" do
    get gank_sessions_url
    assert_response :success
  end

  test "does get new" do
    get new_gank_session_url
    assert_response :success
  end

  test "does create gank_session" do
    assert_difference('GankSession.count') do
      create_gank_session
    end

    assert_redirected_to gank_session_url(GankSession.last)
  end

  test "does set gank_session.start_time" do
    create_gank_session

    assert_not_nil(GankSession.last.start_time)
  end

  test "does show gank_session" do
    get gank_session_url(@gank_session)
    assert_response :success
  end

  test "does get edit" do
    get edit_gank_session_url(@gank_session)
    assert_response :success
  end

  test "does update gank_session" do
    patch gank_session_url(@gank_session, format: :html),
          params: { gank_session: { gank_session_characters_attributes: { "0" => { character_id: @character.id }} } }
    assert_redirected_to gank_session_url(@gank_session)
  end

  test "does destroy gank_session" do
    assert_difference('GankSession.count', -1) do
      delete gank_session_url(@gank_session)
    end

    assert_redirected_to gank_sessions_url
  end

  private

  def create_gank_session
    post gank_sessions_url, params: { gank_session: { gank_session_characters_attributes: { "0" => { character_id: @character.id }} } }
  end
end
